class Company < ApplicationRecord
  # アソシエーションの設定
  has_one :user
end