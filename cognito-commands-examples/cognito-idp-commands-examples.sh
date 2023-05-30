#!/bin/bash

printf "Script of AWS CLI Cognito (cognito-idp) commands examples\n"

printf "Creating a new AWS Cognito user pool\n"

aws cognito-idp create-user-pool --pool-name <value> --username-attributes <value> --auto-verified-attributes <value> --policies <value> --schema <value> --account-recovery-setting <value> --region <value>

printf "Listing the user pools related to the AWS account that is using the command\n"

aws cognito-idp list-user-pools --region <value> --output <value>

printf "Creating an user pool client\n"

aws cognito-idp create-user-pool-client --user-pool-id <value> --client-name <value> --generate-secret --explicit-auth-flows <value> --id-token-validity <value> --access-token-validity <value> --refresh-token-validity <value> --token-validity-units <value> --allowed-o-auth-flows <value> --allowed-o-auth-scopes <value>

printf "Adding a Cognito Authorizer to API Gateway\n"
printf "This is done by the API Gateway command\n"

aws apigateway create-authorizer --name <value> --rest-api-id <value> --type <value> --provider-arns <value> --identity-source <value>


