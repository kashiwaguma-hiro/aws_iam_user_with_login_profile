resource "aws_iam_user" "default" {
  for_each      = var.iam_users
  name          = each.key
  force_destroy = var.force_destroy
}

resource "aws_iam_user_login_profile" "default" {
  for_each                = var.iam_users
  user                    = each.key
  pgp_key                 = each.value.pgp_key
  password_length = var.password_length
  password_reset_required = var.password_reset_required

  lifecycle {
    ignore_changes = [
      password_length,
      password_reset_required,
      pgp_key,
    ]
  }
  depends_on = [aws_iam_user.default]
}

resource "aws_iam_user_group_membership" "default" {
  for_each   = var.iam_users
  groups     = each.value.groups
  user       = each.key
  depends_on = [aws_iam_user.default]
}