#!/bin/bash

printf "Script of AWS CLI DynamoDB commands examples\n"

printf "Adding a new table to the account that is using the command\n"

aws dynamodb create-table --table-name <value> --attribute-definitions <values> --key-schema <value> --region <value>

printf "Listing table names\n"

aws dynamodb list-tables --output <value>


