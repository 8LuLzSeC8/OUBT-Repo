# Create a minimal Lambda package automatically
data "archive_file" "lambda_package" {
  type        = "zip"
  output_path = "${path.module}/lambda.zip"

  source {
    content  = <<EOF
def lambda_handler(event, context):
    return {
        "statusCode": 200,
        "body": "Day 5 Lambda created successfully"
    }
EOF
    filename = "lambda_function.py"
  }
}

# IAM role for Lambda
resource "aws_iam_role" "lambda_exec_role" {
  name = "lambda-basic-exec-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

# Attach logging permissions
resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.lambda_exec_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Lambda function (no external zip needed)
resource "aws_lambda_function" "my_lambda" {
  function_name = "my-practice-lambda"
  role          = aws_iam_role.lambda_exec_role.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.10"

  filename         = data.archive_file.lambda_package.output_path
  source_code_hash = data.archive_file.lambda_package.output_base64sha256

  timeout = 10

  tags = {
    Environment = var.environment
    Project     = "day5-handson"
    Owner       = "data-platform"
  }
}
