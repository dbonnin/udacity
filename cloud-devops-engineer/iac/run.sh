#!/bin/bash

ACTION=$1
STACK_NAME=$2
TEMPLATE_NAME=$3
PARMS_NAME=$4
REGION=$5

if [ $ACTION == "deploy" ]; then
    aws cloudformation deploy \
        --stack-name $STACK_NAME \
        --template-file $TEMPLATE_NAME \
        --parameter-overrides file://$PARMS_NAME \
        --region=$REGION
elif [ $ACTION == "delete" ]; then
    aws cloudformation delete-stack \
        --stack-name $STACK_NAME \
        --region=$REGION
else
    echo "Usage: ./run.sh [deploy|delete|describe|list|events|outputs|validate|get|preview] [stack-name] [template-name] [parameters-name] [region]"
fi
