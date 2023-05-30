# Summary of this file

In this file there are some examples of the `aws dynamodb` command (known as the AWS DynamoDB service), like creating a table.

## Example 1 - Adding a new table
`aws dynamodb create-table --table-name <value> --attribute-definitions <values> --key-schema <value> --region <value>`

### Explanation

The `create-table` command adds a new table to the account that is using the command.

The `--table-name` option is required for the `create-table` command and it expects a String as the name of the table to be created.

The `--attribute-definitions` option is required for the `create-table` command and it expects an array of attributes that describes the key schema for the table and indexes. 
For example: `--attribute-definitions AttributeName=attributenamehere,AttributeType="S"` where `AttributeType=` expects one of these 3 values: `S` for String, `N` for Number or `B` for Binary.
Another example: `--attribute-definitions AttributeName=firstname,AttributeType="S" AttributeName=age,AttributeType="N"`

The `--key-schema` option is required for the `create-table` command and it expects a list that specifies the attributes that make up the primary key for a table or an index. It's important to note that the attributes declared in `--key-schema` option must also be defined in the `--attribute-definitions` array at the command. For example: `--key-schema AttributeName=firstname,KeyType=HASH` where `KeyType=` expects one of these 2 values: `"HASH"` for partition key role or `RANGE` for sort key role.

The `--region` option expects a String as the region to use. For example: `--region "us-east-1"`

## Example 2 - Listing table names
`aws dynamodb list-tables --output <value>`

### Explanation

The `list-tables` command returns an array of table names associated with the account that is using the command and the endpoint.

The `--output` option expects a String as the formatting style for command output. For example: `--output yaml` where it can be `json`, `yaml`, `yaml-stream`, `text` and `table`.

Source: AWS documentation
