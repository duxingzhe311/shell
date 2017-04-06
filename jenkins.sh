#!/bin/sh

JOB_NAME='preonline.pay-center.build'
MODULE_NAME=$(echo ${JOB_NAME} | cut -d '.' -f1)
echo $MODULE_NAME