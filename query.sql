{\rtf1\ansi\ansicpg1252\cocoartf2638
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 WITH temp1 AS \
    (SELECT name,\
         high,\
         ts,\
         SUBSTRING(ts,\
         12,\
         2) AS hourNum\
    FROM "project3-queries"."15"), temp2 AS \
    (SELECT temp1.name AS StockName,\
         MAX(temp1.high) AS highestPrice,\
         temp1.hourNum AS hourNum\
    FROM temp1\
    GROUP BY  temp1.name, temp1.hourNum)\
SELECT temp2.StockName,\
         temp2.highestPrice,\
         temp2.hourNum,\
         temp1.ts\
FROM temp1, temp2\
WHERE temp1.name = temp2.StockName\
        AND temp1.high = temp2.highestPrice\
        AND temp1.hourNum = temp2.hourNum\
ORDER BY  temp2.StockName, temp2.hourNum}