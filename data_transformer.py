import os
import json
import boto3
import random
import datetime
import yfinance as yf
from time import sleep

REGION = os.environ['REGION']
STREAM = os.environ['STREAM']

kinesis = boto3.client('kinesis', region_name=REGION)

def lambda_handler(event, context):
    
    target_stocks=["FB", "SHOP", "BYND", "NFLX", "PINS", "SQ", "TTD", "OKTA", "SNAP", "DDOG"]
    data = {}
    for q in target_stocks:
        name = yf.Ticker(q)
        stock_history = name.history(start="2022-05-02", end="2022-05-03", period="1d", interval="5m")
        stock_history = stock_history.loc['2022-05-02']
        for index, row in stock_history.iterrows():
            data = {'high':row["High"], 'low':row["Low"], 'ts':index.strftime('%Y-%m-%d %X'), 'name':q}
            view_data = json.dumps(data)+"\n"
            print(json)
            kinesis.put_record(
                StreamName=STREAM,
                Data=view_data,
                PartitionKey="partitionkey")
            sleep(1)

    return {
        'statusCode': 200,
        'body': json.dumps('Done!')
    }
