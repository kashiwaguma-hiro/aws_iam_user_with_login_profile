output "encrypted_passwords" {
  value = zipmap(values(aws_iam_user_login_profile.default)[*].user, values(aws_iam_user_login_profile.default)[*].encrypted_password)
}