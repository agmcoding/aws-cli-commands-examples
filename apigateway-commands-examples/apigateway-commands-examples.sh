#!/bin/bash

printf "Script of AWS CLI API Gateway commands examples\n"

printf "Creating a new Rest API resource\n"

aws apigateway create-rest-api --name <value> --description <value> --region <value>

printf "Listing information about a collection of Resource resources\n"

aws apigateway get-resources ---region <value> --rest-api-id <value>

printf "Creating a Resource resource\n"

aws apigateway create-resource --rest-api-id <value> --parent-id <value> --path-part <value>

printf "Adding a method to an existing Resource resource\n"

aws apigateway put-method --rest-api-id <value> --resource-id <value> --http-method <value> --authorization-type <value>

printf "Adding a new authorizer resource to an existing Rest API resource\n"

aws apigateway create-authorizer --name <value> --rest-api-id <value> --type <value> --provider-arns <value> --identity-source <value>


