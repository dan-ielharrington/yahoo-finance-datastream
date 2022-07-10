# Streaming Yahoo Finance Data with AWS Lambda
***

### Project Description: 
This project provisions Lambda functions to generate near-real time data from Yahoo Finance; the data was then processed and queried using AWS Athena and results were exported to a csv file for additional processing in Jupyter Notebook running a Python3 kernel. The selection of stock data analyzed for this project includes:
Facebook (FB), Shopify (SHOP), Beyond Meat (BYND), Netflix (NFLX), Pinterest (PINS)
Square (SQ), The Trade Desk (TTD), Okta (OKTA), Snap (SNAP) and Datadog (DDOG).  
All Yahoo finance data is from May 02, 2022.
***
#### Lambda Deployment Package

In order to run lambda functions that work with many of the python libraries listed below, a _deployment package_ must be leveraged to manage dependencies. A zipped artifact containing all necessary dependencies is recommended. 

### Technologies: 
#### AWS: 
- Athena  
- Glue  
- Kinesis  
- Lambda  
- S3 

#### Python Libraries:
- boto3  
- csv  
- datetime  
- json  
- matplotlib  
- numpy  
- seaborn  
- yfinance


### Infrastructure
This project consists of three major infrastructure elements that work in tandem:

- A lambda function that collects data 
- A lambda function that transforms and places data into S3
- A serverless process that allows ad hoc queries of the S3 data 
