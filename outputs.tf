output "name" {
  value = values(aws_iam_user.default)[*].name
}

output "arns" {
  value = values(aws_iam_user.default)[*].arn
}

output "encrypted_passwords" {
  value = values(aws_iam_user_login_profile.default)[*].encrypted_password
}

output "encrypted_passwords_map" {
  value = zipmap(values(aws_iam_user_login_profile.default)[*].user, values(aws_iam_user_login_profile.default)[*].encrypted_password)
}

