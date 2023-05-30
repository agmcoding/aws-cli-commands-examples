# Summary of this file

In this file there are some examples of the `aws apigateway` command (known as the AWS API Gateway service), like creating a Rest API and creating resources.

## Example 1 - Creating a new Rest API resource
`aws apigateway create-rest-api --name <value> --description <value> --region <value>`

### Explanation

The `create-rest-api` command creates a new Rest API resource.

The `--name` option is required for the `create-rest-api` command and it expects a String as a name for the Rest API to be created. For example: `--name NewRestApi`

The `--descrition` option expects a String as a description for the Rest API to be created. For example: `--description "New Rest API for the services"`

The `--region` option expects a String as the region to use. For example: `--region "us-east-1"`

## Example 2 - Listing information about a collection of resources
`aws apigateway get-resources ---region <value> --rest-api-id <value>`

### Explanation

The `get-resources` command lists information about a collection of Resource resources. **Note:** There are two similar commands, `get-resources` and `get-resource`, where `get-resource` lists information about a resource.

The `--region` option expects a String as the region to use. For example: `--region "us-east-1"`

The `--rest-api-id` option is required for the `get-resources` command and it expects a String as the identifier of the associated Rest API. For example: `--rest-api-id "requestedrestapiid"`

## Example 3 - Creating a resource
`aws apigateway create-resource --rest-api-id <value> --parent-id <value> --path-part <value>`

### Explanation

The `create-resource` command creates a Resource resource. 

The `--rest-api-id` option is required for the `create-resource` command and it expects a String as the identifier of the associated Rest API. For example: `--rest-api-id "requestedrestapiid"`

The `--parent-id` option is required for the `create-resource` command and it expects a String as the parent resource's identifier. For example: `--parent-id "identifieroftheparentresource"`

The `--path-part` option is required for the `create-resource` command and it expects a String as the last path segment for this resource. It can also be refered as the name of the resource to be created. For example: `--path-part "resourcename"`

## Example 4 - Adding a method to an existing resource
`aws apigateway put-method --rest-api-id <value> --resource-id <value> --http-method <value> --authorization-type <value>`

### Explanation

The `put-method` command adds a method to an existing Resource resource.

The `--rest-api-id` option is required for the `put-method` command and it expects a String as the identifier of the associated Rest API. For example: `--rest-api-id "requestedrestapiid"`

The `--resource-id` option is required for the `put-method` command and it expects a String as the Resource identifier for the new Method resource. For example: `--resource-id "resourceid"`

The `--http-method` option is required for the `put-method` command and it expects a String that specifies the method request's HTTP method type. For example: `--http-method "GET"` 

The `--authorization-type` option is required for the `put-method` command and it expects a String as the method's authorization type. For example: `--authorization-type "NONE"` where "NONE" means open access.

## Example 5 - Adding a Cognito Authorizer to API Gateway
`aws apigateway create-authorizer --name <value> --rest-api-id <value> --type <value> --provider-arns <value> --identity-source <value>`

### Explanation

The `create-authorizer` commmand adds a new authorizer resource to an existing Rest API resource.

The `--name` option is required for the `create-authorizer` command and it expects a String as the name of the new authorizer. For example: `--name "name-of-the-new-authorizer"`

The `--rest-api-id` option is required for the `create-authorizer` command and it expects a String as the identifier of the associated Rest API. For example: `--rest-api-id "requestedrestapiid"`

The `--type` option is required for the `create-authorizer` command and it expects a String as the authorizer type, where values can be `TOKEN`, `REQUEST` and `COGNITO_USER_POOLS`. In this example, the value `COGNITO_USER_POOLS` is for using the AWS Cognito user pool. For example: `--type "COGNITO_USER_POOLS"`

The `--provider-arns` option expects a list of AWS Cognito user pool ARNs (Amazon Resource Names) when using the `COGNITO_USER_POOLS` authorizer type in the `--type` option. For example: `--provider-arns "arn:aws:cognito-idp:{region}:{account_id}:userpool/{user_pool_id}"`

The `--identity-source` option is required if using the `COGNITO_USER_POOLS` or the `TOKEN` authorizer type in the `--type` option. It expects a String as the identity source for which authorization is requested. It specifies the request header mapping expression for the custom header holding the authorization token submitted by the client. For example: `--identity-source "method.request.header.Authorization"`

Source: AWS documentation
