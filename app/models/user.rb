class User < ApplicationRecord
  # アソシエーションの設定
  belongs_to :company
  # パスワードをハッシュ化
  has_secure_password
end
