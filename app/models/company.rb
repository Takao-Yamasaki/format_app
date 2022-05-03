class Company < ApplicationRecord
  # アソシエーションの設定
  has_many :user
end