# Explanation of the Lambda function with a Java code example

This is just an example of a java class with a `handle()` request method that can be uploaded with a java project to AWS Lambda. Here it explains some of the preparation, uploading the code and calling the Lambda Function with the AWS CLI.

## Preparation

The current java runtimes support in AWS Lambda is for java 11 and 8 from Amazon Linux. More details can be found at the AWS documentation.

This java code is just a class that contains a request handler method. That so, it is necessary to create a java project, move this java class file to a package from the created project and add the necessary dependencies in the project. For creating a java project and adding dependencies, you can choose the approach that you prefer. One way is creating a project with a package manager, like Maven or Gradle, that could build the structure of the project and manage dependecies.

## Packing

You may choose a java package manager according to your preferences, so that the java application can be packaged and uploaded to AWS Lambda.
With Maven, for example, you can go the command line, go to the directory where is the java project and type:
`mvn clean package`

This will allow Maven to clean target files, then `package` packages the project and creates a *.jar* file (java archive file) with the dependencies and contents from the project.
That *.jar* file can be uploaded to the AWS Lambda as a runtime for a new Lambda Function.

## Uploading the Java Code to Lambda

You may choose the approach according to your preferences.
One of the approaches is using the AWS CLI (Command Line Interface):

### Creating a Lambda Function

Through the AWS CLI, the `aws lambda create-function` command can be used:
`aws lambda create-function --function-name <value> --runtime <value> --zip-file <value> --handler <value> --timeout <value> --region <value> --role <value>`

#### Explanation of this Lambda command

The `create-function` command creates a Lambda function.

The `--function-name` option is required for the `create-function` command and it expects a String as the name of the Lambda function. For example: `--function-name "name-of-the-new-function"` where in this example the name was typed in the **Function name** format, and there are 2 other possible formats: the **Function ARN** and the **Partial ARN**.

The `--runtime` option is required for the `create-function` command and it expects a String as the identifier of the function's runtime. For example: `--runtime  "java11"` 

The `--zip-file` option expects a *blob* (Binay Large Object) as the path to the zip file of the code to be uploaded to a new Lambda function. For example: `--zip-file "fileb://code.zip"` 
In this case, with a java project, a *.jar* file can be uploaded. For example: `--zip-file "fileb://java-code.jar"`

The `--handler` option is required for the `create-function` command if the deployment package is a *.zip* file archive. It expects a String as the name of the method within the code to be uploaded to the new Lambda function. That's the method that Lambda will call to run.

The `--timeout` option expects an integer as the the amount of time in seconds that the new function should be allowed to run before stopping it. For example: `--timeout 3`, that means 3 seconds (default).

The `--region` option expects a String as the region to use. For example: `--region "us-east-1"`

The `--role` option is required for the `create-function` command and it expects a String as the ARN (Amazon Resource Name) of the function's execution role. For example: `--role "arn:aws:iam::accountid:role/rolepathname"`

If you want to create a role for the Lambda function, you may want to use the `aws iam` command (known as the AWS Identity Access Management - IAM service) and use the command `aws iam create-role` for this specific new Lambda function. In this project of AWS CLI commands examples, there is an example of this command `aws iam create-role` in the *iam-commands-examples* file. As always, check the AWS documentation for more details.

## Calling the Lambda function

Through the AWS CLI, the `aws lambda invoke` command can be used:
`aws lambda invoke --function-name <value> --invocation-type <value> --payload <value> --output <value> <outfile>`

### Explanation

The `invoke` command invokes a Lambda function.

The `--function-name` option is required for the `invoke` command and it expects a String as the name of the Lambda function, version or alias. For example: `--function-name "name-of-the-function"` where in this example the name was typed in the **Function name** format, and there are 2 other possible formats: the **Function ARN** and the **Partial ARN**. The version or the alias of the function can be appended in any of the shown formats, or they can be specified at a `--qualifier <value>` option.

The `--invocation-type` option expects a String as one of these values: `RequestResponse` (default), `Event` and `DryRun`. For example: `--invocation-type "RequestResponse"`

The `--payload` option expects a *blob* (Binay Large Object) as the JSON  input for the Lambda function, if provided. For example, the input can be either a JSON itself, like: `--payload '{ "name": "Duke" }'`, or a file path, like: `--payload "file://json-file.json"`

The `--output` option expects a String as the formatting style for command output. For example: `--output yaml` where it can be `json`, `yaml`, `yaml-stream`, `text` and `table`.

The `<outfile>` option does not need to be typed in the command. It expects a String as the file where the response content will be saved. For example: `aws lambda invoke --function-name "name-of-the-function" file-to-save-function-response.json`

Source: AWS documentation
