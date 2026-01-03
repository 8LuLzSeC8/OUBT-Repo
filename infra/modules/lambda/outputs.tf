output "lambda_function_name" {
  value = aws_lambda_function.my_lambda.function_name
}

output "lambda_role_name" {
  value = aws_iam_role.lambda_exec_role.name
}
