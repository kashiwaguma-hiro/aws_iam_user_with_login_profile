variable "iam_users" {
  type = map(object({
    groups  = list(string)
    pgp_key = string
    tags    = map(string)
  }))
  description = "作成するIAM User情報"
}

variable "iam_user_force_destroy" {
  type        = bool
  description = "Destroy実行時に、Terraform管理外のMFA・キーを生成している場合でもユーザを削除する"
  default     = false
}

variable "login_password_length" {
  type        = number
  description = "生成する初期ログインパスワードの長さ"
  default     = 20
}

variable "login_password_reset_required" {
  type        = bool
  description = "ログイン後のパスワードリセットを強制する"
  default     = true
}
