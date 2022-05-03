class CompanyUser
  # 擬似モデル
  include ActiveModel::Model
  include ActiveRecord::AttributeAssignment
  # 参照更新用
  attr_accessor :company_name, :address, :user_name, :email, :password, :password_confirmation

  # 空でない
  with_options presence: true do
    # Companyモデルのバリデーション
    validates :company_name, length: {maximum: 10}
    validates :address, length: {maximum: 20}
    # Userモデルのバリデーション
    validates :user_name, length: {maximum: 10}
    validates :email
    validates :password, length: {is: 8}
  end

  def save
    return false unless valid?
    # Companyを保存
    company = Company.create(company_name: company_name, address: address)
    # ブレークポイントの設置
    # binding.pry
    # Userを保存
    User.create(user_name: user_name, email: email, password: password, company_id: company.id)
  end
end