# Summary of this file

It has some examples of the `aws lambda` command (known as the AWS Lambda functions service), like creating a function and listing functions on the command line.

## Example 1 - Creating a Lambda function
`aws lambda create-function --function-name <value> --description <value> --runtime <value> --zip-file <value> --handler <value> --timeout <value> --region <value> --role <value>`

### Explanation

The `create-function` command creates a Lambda function.

The `--function-name` option is required for the `create-function` command and it expects a String as the name of the Lambda function. For example: `--function-name "name-of-the-new-function"` where in this example the name was typed in the **Function name** format, and there are 2 other possible formats: the **Function ARN** and the **Partial ARN**.

The `--description` option expects a String as a description for the Lambda function to be created. For example: `--description "New Lambda function for the services"`

The `--runtime` option is required for the `create-function` command and it expects a String as the identifier of the function's runtime. For example: `--runtime  "java11"` 

The `--zip-file` option expects a *blob* (Binay Large Object) as the path to the zip file of the code to be uploaded to a new Lambda function. For example: `--zip-file "fileb://code.zip"`

**Note:** In the command, do not use both `--zip-file` and `--code` option, just one or the other. The `--code` option specifies an Amazon S3 location.

The `--handler` option is required for the `create-function` command if the deployment package is a *.zip* file archive. It expects a String as the name of the method within the code to be uploaded to the new Lambda function. That's the method that Lambda will call to run.

The `--timeout` option expects an integer as the the amount of time in seconds that the new function should be allowed to run before stopping it. For example: `--timeout 3`, that means 3 seconds (default).

The `--region` option expects a String as the region to use. For example: `--region "us-east-1"`

The `--role` option is required for the `create-function` command and it expects a String as the ARN (Amazon Resource Name) of the function's execution role. For example: `--role "arn:aws:iam::accountid:role/rolepathname"`

If you want to create a role for the Lambda function, you may want to use the `aws iam` command (known as the AWS Identity Access Management - IAM service) and use the command `aws iam create-role` for this specific new Lambda function.

#### Creating a Role for a Lambda Function

Through the AWS CLI, these commands can be used:
`aws iam create-role --role-name <value> --path <value> --assume-role-policy-document <value>`

##### Explanation

The `create-role` command creates a new role for the AWS account that is using the command.

The `--role-name` option is required for the `create-role` command and it expects a String as the name of the role to be created. For example: `--role-name "new-role-for-lambda-function-name"`

The `--path` option expects a String as the path to the role. This is optional, if no path is assigned to it, the default path will be assigned (/). For example: `--path "/role-path"`

The `--assume-role-policy-document` option is required for the `create-role` command and it expects a trust relationship policy document that grants an entity permission to assume the role.

## Example 2 - Listing Lambda functions
`aws lambda list-functions --region <value> --output <value>`

### Explanation

The `list-functions` command returns a list of Lambda functions.

The `--region` option expects a String as the region to use. For example: `--region "us-east-1"`

The `--output` option expects a String as the formatting style for command output. For example: `--output yaml` where it can be `json`, `yaml`, `yaml-stream`, `text` and `table`.

## Example 3 - Getting information about a function
`aws lambda get-function --function-name <value> --region <value> --output <value>`

### Explanation

The `get-function` command returns information about the function or function version.

The `--function-name` option is required for the `get-function` command and it expects a String as the name of the Lambda function, version or alias. For example: `--function-name "name-of-the-function"` where in this example the name was typed in the **Function name** format, and there are 2 other possible formats: the **Function ARN** and the **Partial ARN**. The version or the alias of the function can be appended in any of the shown formats, or they can be specified at a `--qualifier <value>` option.

The `--region` option expects a String as the region to use. For example: `--region "us-east-1"`

The `--output` option expects a String as the formatting style for command output. For example: `--output yaml` where it can be `json`, `yaml`, `yaml-stream`, `text` and `table`.

## Example 4 - Calling a Lambda function
`aws lambda invoke --function-name <value> --invocation-type <value> --payload <value> --output <value> <outfile>`

### Explanation

The `invoke` command invokes a Lambda function.

The `--function-name` option is required for the `invoke` command and it expects a String as the name of the Lambda function, version or alias. For example: `--function-name "name-of-the-function"` where in this example the name was typed in the **Function name** format, and there are 2 other possible formats: the **Function ARN** and the **Partial ARN**. The version or the alias of the function can be appended in any of the shown formats, or they can be specified at a `--qualifier <value>` option.

The `--invocation-type` option expects a String as one of these values: `RequestResponse` (default), `Event` and `DryRun`. For example: `--invocation-type "RequestResponse"`

The `--payload` option expects a *blob* (Binay Large Object) as the JSON  input for the Lambda function, if provided. For example, the input can be either a JSON itself, like: `--payload '{ "name": "Duke" }'`, or a file path, like: `--payload "file://json-file.json"`

The `--output` option expects a String as the formatting style for command output. For example: `--output yaml` where it can be `json`, `yaml`, `yaml-stream`, `text` and `table`.

The `<outfile>` option does not need to be typed in the command. It expects a String as the file where the response content will be saved. For example: `aws lambda invoke --function-name "name-of-the-function" file-to-save-function-response.json`

Source: AWS documentation
