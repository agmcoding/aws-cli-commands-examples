#!/bin/bash

printf "Script of AWS CLI IAM (Identity Access Management) commands examples\n"

printf "Creating a new IAM user for the AWS account that is using the command\n"

aws iam create-user --user-name <value> --path <value>

printf "Attaching the specified managed policy to the specified IAM user\n"

aws iam attach-user-policy --user-name <value> --policy-arn <value>

printf "Creating a new role for the AWS account that is using the command\n"

aws iam create-role --role-name <value> --path <value> --assume-role-policy-document <value>

printf "Creating a new IAM group for the AWS account that is using the command\n"

aws iam create-group --group-name <value>

printf "Attaching a managed policy to an IAM group\n"

aws iam attach-group-policy --group-name <value> --policy-arn <value>

printf "Adding an IAM user to a group\n"

aws iam add-user-to-group --user-name <value> --group-name <value>


