# Summary of this file

It has some examples of the `aws cognito-idp` command (known as the AWS Cognito user pools API service), like creating a user pool.

## Example 1 - Creating a new Cognito user pool

`aws cognito-idp create-user-pool --pool-name <value> --username-attributes <value> --auto-verified-attributes <value> --policies <value> --schema <value> --account-recovery-setting <value> --region <value>`

The `create-user-pool` command creates a new AWS Cognito user pool.

The `--pool-name` option is required for the `create-user-pool` command and it expects a String as the name of the new user pool.
For example: `--pool-name "name-of-the-user-pool"`

The `--username-attributes` option expects a list of String as the attributes to specify if a user can use an email address or phone number as the username when they sign up.
For example: `--username-attributes "email" "phone_number"`

The `--auto-verified-attributes` option expects a list of String as the attributes to be auto-verified.
For example: `--auto-verified-attributes "email" "phone_number"`

The `--policies` option expects a structure of policies related to the new user pool.
For example, in shorthand syntax: `--policies PasswordPolicy={MinimumLength=10,RequireUppercase=true,RequireLowercase=true,RequireNumbers=true,RequireSymbols=true,TemporaryPasswordValidityDays=14}`

The `--schema` option expects a list of schema attributes for the new user pool.
For example: `--schema Name=name-of-an-attribute,AttributeDataType=String,DeveloperOnlyAttribute=false,Mutable=true,Required=true,StringAttributeConstrains={MinLength=10,MaxLength=30} ...`

The `--account-recovery-setting` option expects a list of recovery mechanisms so that users can recover their password when they call *ForgotPassword*.
For example: `--account-recovery-setting RecoveryMechanisms=[{Priority=1,Name=verified_email},{Priority=2,Name=verified_phone_number}]`

The `--region` option expects a String as the region to use.
For example: `--region "us-east-1"`

## Example 2 - Listing user pools

`aws cognito-idp list-user-pools --region <value> --output <value>`

The `list-user-pools` command lists the user pools related to the AWS account that is using the command.

The `--region` option expects a String as the region to use.
For example: `--region "us-east-1"`

The `--output` option expects a String as the formatting style for command output.
For example: `--output yaml` where it can be `json`, `yaml`, `yaml-stream`, `text` and `table`.

## Example 3 - Creating an user pool client

`aws cognito-idp create-user-pool-client --user-pool-id <value> --client-name <value> --generate-secret --explicit-auth-flows <value> --id-token-validity <value> --access-token-validity <value> --refresh-token-validity <value> --token-validity-units <value> --allowed-o-auth-flows <value> --allowed-o-auth-scopes <value>`

Some of the commands can be related to both AWS Cognito and OAuth protocol. You may want to find more information by searching about OAuth and tokens.

The `create-user-pool-client` command creates a user pool client.

The `--user-pool-id` option is required for the `create-user-pool-client` command and it expects a String as the user pool ID where it will be created the new user pool client.
For example: `--user-pool-id "us-east-1_user-pool-id"`

The `--client-name` option is required for the `create-user-pool-client` command and it expects a String as the name of the new user pool client.
For example: `--client-name "name-of-the-user-pool-client"`

The `--generate-secret` option is the opposite of the `--no-generate-secret` option and they specify whether it should generate a secret for the new user pool client. No value is necessary for them, just the options themselves indicate what to do.

The `--explicit-auth-flows` option expects a list of authentication flows that the user pool client will support.
For example: `--explicit-auth-flows "ALLOW_USER_SRP_AUTH" "ALLOW_REFRESH_TOKEN_AUTH" "ALLOW_CUSTOM_AUTH"`

The `--id-token-validity` option expects an Integer as the ID token time limit.
For example: `--id-token-validity 1`, where the time unit of it can be specified in the `--token-validity-units` option in the command.

The `--access-token-validity` option expects an Integer as the access token time limit.
For example: `--access-token-validity 1`, where the time unit of it can be specified in the `--token-validity-units` option in the command.

The `--refresh-token-validity` option expects an Integer as the refresh token time limit.
For example: `--refresh-token-validity 30`, where the time unit of it can be specified in the `--token-validity-units` option in the command.

The `--token-validity-units` option expects a structure of units representing the validity times for `--id-token-validity`, `--access-token-validity` and `--refresh-token-validity` options.
For example, in shorthand syntax: `--token-validity-units AccessToken=hours,IdToken=hours,RefreshToken=days`

The `--allowed-o-auth-flows` option expects a list of allowed OAuth flows.
For example: `--allowed-o-auth-flows "code" "implicit"`

The `--allowed-o-auth-scopes` option expects a list of allowed OAuth scopes.
For example: `--allowed-o-auth-scopes "email" "openid"`

## Example 4 - Adding a Cognito Authorizer to API Gateway

`aws apigateway create-authorizer --name <value> --rest-api-id <value> --type <value> --provider-arns <value> --identity-source <value>`

In this example, the necessary command is from the `aws apigateway` command (known as the AWS API Gateway service).

The `create-authorizer` commmand adds a new authorizer resource to an existing Rest API resource.

The `--name` option is required for the `create-authorizer` command and it expects a String as the name of the new authorizer.
For example: `--name "name-of-the-new-authorizer"`

The `--rest-api-id` option is required for the `create-authorizer` command and it expects a String as the identifier of the associated Rest API.
For example: `--rest-api-id "requestedrestapiid"`

The `--type` option is required for the `create-authorizer` command and it expects a String as the authorizer type, where values can be `TOKEN`, `REQUEST` and `COGNITO_USER_POOLS`. In this example, the value `COGNITO_USER_POOLS` is for using the AWS Cognito user pool.
For example: `--type "COGNITO_USER_POOLS"`

The `--provider-arns` option expects a list of AWS Cognito user pool ARNs (Amazon Resource Names) when using the `COGNITO_USER_POOLS` authorizer type in the `--type` option.
For example: `--provider-arns "arn:aws:cognito-idp:{region}:{account_id}:userpool/{user_pool_id}"`

The `--identity-source` option is required if using the `COGNITO_USER_POOLS` or the `TOKEN` authorizer type in the `--type` option. It expects a String as the identity source for which authorization is requested. It specifies the request header mapping expression for the custom header holding the authorization token submitted by the client.
For example: `--identity-source "method.request.header.Authorization"`

Source: AWS documentation
