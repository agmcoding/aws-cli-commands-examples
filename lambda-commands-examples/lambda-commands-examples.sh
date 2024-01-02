#!/bin/bash

printf "Script of AWS CLI Lambda commands examples\n"

printf "Creating a Lambda function\n"

aws lambda create-function --function-name "value" --description "value" --runtime "value" --zip-file "value" --handler "value" --timeout "value" --region "value" --role "value"

printf "Listing Lambda functions\n"

aws lambda list-functions --region "value" --output "value"

printf "Getting information about a function\n"

aws lambda get-function --function-name "value" --region "value" --output "value"

printf "Calling a Lambda function\n"

aws lambda invoke --function-name "value" --invocation-type "value" --payload "value" --output "value" <outfile>


