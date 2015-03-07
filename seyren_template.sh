#!/bin/bash
#set -x

METRIC="real.important.metric"
SHIFT="'7d'"
#Warn and Error levels for each type of Seyren check
TS_WARN="1.0"
TS_ERROR="1.5"
CV_WARN="1.0"
CV_ERROR="1.5"
HW_WARN="1.0"
HW_ERROR="1.5"
SEYREN_API="http://192.168.1.1:8080/api/checks"
#Coefficient of Variation window for calculating moving average and STDEV. Defaults to last 10 data points
CV_WINDOW="10"


#curl command for time shift check 
curl -X POST -H "Accept: application/json" -H "Content-Type:application/json" --data \
"{ \
    \"id\": \"TIMESHIFT_CHECK\", \
    \"name\": \"TIMESHIFT_CHECK\", \
    \"description\": null, \
    \"target\": \"absolute(divideSeries(diffSeries(timeShift($METRIC,$SHIFT),$METRIC),$METRIC))\", \
    \"from\": null, \
    \"until\": null, \
    \"enabled\": true, \
    \"live\": false, \
    \"state\": \"OK\", \
    \"subscriptions\": [ \
        { \
            \"target\": \"SEYREN\", \
            \"type\": \"HIPCHAT\", \
            \"ignoreWarn\": true, \
            \"ignoreError\": false, \
            \"ignoreOk\": true, \
            \"notifyOnWarn\": false, \
            \"notifyOnError\": true, \
            \"notifyOnOk\": false, \
            \"fromTime\": \"0000\", \
            \"toTime\": \"2359\", \
            \"su\": true, \
            \"mo\": true, \
            \"tu\": true, \
            \"we\": true, \
            \"th\": true, \
            \"fr\": true, \
            \"sa\": true, \
            \"enabled\": true \
        }, \
        { \
            \"target\": \"SEYREN\", \
            \"type\": \"LOGGER\", \
            \"ignoreWarn\": true, \
            \"ignoreError\": false, \
            \"ignoreOk\": true, \
            \"notifyOnWarn\": true, \
            \"notifyOnError\": true, \
            \"notifyOnOk\": false, \
            \"fromTime\": \"0000\", \
            \"toTime\": \"2359\", \
            \"su\": true, \
            \"mo\": true, \
            \"tu\": true, \
            \"we\": true, \
            \"th\": true, \
            \"fr\": true, \
            \"sa\": true, \
            \"enabled\": true \
        } \
    ], \
    \"warn\": $TS_WARN, \
    \"error\": $TS_ERROR, \
    \"lastCheck\": 1417211332872 \
}" $SEYREN_API


#curl command for Coefficient of Variation check 
curl -X POST -H "Accept: application/json" -H "Content-Type:application/json" --data \
"{ \
    \"id\": \"CV_CHECK\", \
    \"name\": \"CV_CHECK\", \
    \"description\": null, \
    \"target\": \"divideSeries(stdev($METRIC,$CV_WINDOW),movingAverage($METRIC,$CV_WINDOW))\", \
    \"from\": null, \
    \"until\": null, \
    \"enabled\": true, \
    \"live\": false, \
    \"state\": \"OK\", \
    \"subscriptions\": [ \
        { \
            \"target\": \"SEYREN\", \
            \"type\": \"HIPCHAT\", \
            \"ignoreWarn\": true, \
            \"ignoreError\": false, \
            \"ignoreOk\": true, \
            \"notifyOnWarn\": false, \
            \"notifyOnError\": true, \
            \"notifyOnOk\": false, \
            \"fromTime\": \"0000\", \
            \"toTime\": \"2359\", \
            \"su\": true, \
            \"mo\": true, \
            \"tu\": true, \
            \"we\": true, \
            \"th\": true, \
            \"fr\": true, \
            \"sa\": true, \
            \"enabled\": true \
        }, \
        { \
            \"target\": \"SEYREN\", \
            \"type\": \"LOGGER\", \
            \"ignoreWarn\": true, \
            \"ignoreError\": false, \
            \"ignoreOk\": true, \
            \"notifyOnWarn\": true, \
            \"notifyOnError\": true, \
            \"notifyOnOk\": false, \
            \"fromTime\": \"0000\", \
            \"toTime\": \"2359\", \
            \"su\": true, \
            \"mo\": true, \
            \"tu\": true, \
            \"we\": true, \
            \"th\": true, \
            \"fr\": true, \
            \"sa\": true, \
            \"enabled\": true \
        } \
    ], \
    \"warn\": $CV_WARN, \
    \"error\": $CV_ERROR, \
    \"lastCheck\": 1417211332872 \
}" $SEYREN_API


#curl command for Holt-winter check 
curl -X POST -H "Accept: application/json" -H "Content-Type:application/json" --data \
"{ \
    \"id\": \"HW_CHECK\", \
    \"name\": \"HW_CHECK\", \
    \"description\": null, \
    \"target\": \"absolute(divideSeries(holtWintersAberration($METRIC),$METRIC))\", \
    \"from\": null, \
    \"until\": null, \
    \"enabled\": true, \
    \"live\": false, \
    \"state\": \"OK\", \
    \"subscriptions\": [ \
        { \
            \"target\": \"SEYREN\", \
            \"type\": \"HIPCHAT\", \
            \"ignoreWarn\": true, \
            \"ignoreError\": false, \
            \"ignoreOk\": true, \
            \"notifyOnWarn\": false, \
            \"notifyOnError\": true, \
            \"notifyOnOk\": false, \
            \"fromTime\": \"0000\", \
            \"toTime\": \"2359\", \
            \"su\": true, \
            \"mo\": true, \
            \"tu\": true, \
            \"we\": true, \
            \"th\": true, \
            \"fr\": true, \
            \"sa\": true, \
            \"enabled\": true \
        }, \
        { \
            \"target\": \"SEYREN\", \
            \"type\": \"LOGGER\", \
            \"ignoreWarn\": true, \
            \"ignoreError\": false, \
            \"ignoreOk\": true, \
            \"notifyOnWarn\": true, \
            \"notifyOnError\": true, \
            \"notifyOnOk\": false, \
            \"fromTime\": \"0000\", \
            \"toTime\": \"2359\", \
            \"su\": true, \
            \"mo\": true, \
            \"tu\": true, \
            \"we\": true, \
            \"th\": true, \
            \"fr\": true, \
            \"sa\": true, \
            \"enabled\": true \
        } \
    ], \
    \"warn\": $HW_WARN, \
    \"error\": $HW_ERROR, \
    \"lastCheck\": 1417211332872 \
}" $SEYREN_API
