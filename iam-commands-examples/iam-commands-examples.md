# Summary of this file

It has some examples of the `aws iam` command (known as the AWS Identity Access Management - IAM service), like creating an user, a role and a group.

## Example 1 - Creating an User

`aws iam create-user --user-name <value> --path <value>`

The `create-user` command creates a new IAM user for the AWS account that is using the command.

The `--user-name` option is required for the `create-user` command and it expects a String as the name of the new user.
For example: `--user-name "name-of-the-new-user"`

The `--path` option expects a String as the path to the user. This is optional, if no path is assigned to it, the default path will be assigned (/).
For example: `--path "/user-name"`

## Example 2 - Attaching an User Policy

`aws iam attach-user-policy --user-name <value> --policy-arn <value>`

The `attach-user-policy` command attachs the specified managed policy to the specified IAM user.

The `--user-name` option is required for the `attach-user-policy` command and it expects a String as the name of the IAM user. The name should be in the friendly format, not ARN (Amazon Resource Name) format.
For example: `--user-name "name-of-the-user"`

The `--policy-arn` option is required for the `attach-user-policy` command and it expects a String as the ARN of the IAM policy to attach to the specified user.
For example: `--policy-arn " arn:aws:iam::aws:policy/PolicyName"`

## Example 3 - Creating a Role

`aws iam create-role --role-name <value> --path <value> --assume-role-policy-document <value>`

The `create-role` command creates a new role for the AWS account that is using the command.

The `--role-name` option is required for the `create-role` command and it expects a String as the name of the role to be created.
For example: `--role-name "new-role-for-access-to-a-service"`

The `--path` option expects a String as the path to the role. This is optional, so if no path is assigned the default path will be assigned (/).
For example: `--path "/role-path"`

The `--assume-role-policy-document` option is required for the `create-role` command and it expects a trust relationship policy document that grants an entity permission to assume the role.

## Example 4 - Creating a Group

`aws iam create-group --group-name <value>`

The `create-group` command creates a new IAM group for the AWS account that is using the command.

The `--group-name` option is required for the `create-group` command and it expects a String as the name of the new group.
For example: `--group-name "name-of-the-new-group"`

The `--path` option expects a String as the path to the group. This is optional, if no path is assigned to it, the default path will be assigned (/).
For example: `--path "/group-name"`

## Example 5 - Attaching a Group Policy

`aws iam attach-group-policy --group-name <value> --policy-arn <value>`

The `attach-group-policy` command attachs the specified managed policy to the specified IAM group.

The `--group-name` option is required for the `attach-group-policy` command and it expects a String as the name of the IAM group. The name should be in the friendly format, not ARN (Amazon Resource Name) format.
For example: `--group-name "name-of-the-group"`

The `--policy-arn` option is required for the `attach-group-policy` command and it expects a String as the ARN of the IAM policy to attach to the specified group.
For example: `--policy-arn " arn:aws:iam::aws:policy/PolicyName"`

## Example 6 - Adding an User to a Group

`aws iam add-user-to-group --user-name <value> --group-name <value>`

The `add-user-to-group` command adds the specified IAM user to the specified group.

The `--user-name` option is required for the `add-user-to-group` command and it expects a String as the name of the user to be added to the specified group.
For example: `--user-name "name-of-the-user"`

The `--group-name` option is required for the `add-user-to-group` command and it expects a String as the name of the group where the user will be added.
For example: `--group-name "name-of-the-group"`

Source: AWS documentation
