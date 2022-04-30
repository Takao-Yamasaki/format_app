class CompanyUser
  # 擬似モデル
  include ActiveModel::Model
  # 参照更新用
  attr_accessor :company_name, :address, :use_name, :email, :password, :password_confirmation

  with_options presence: true do
    # Companyモデルのバリデーション
    validates :company_name
    validates :address
    # Userモデルのバリデーション
    validates :user_name
    validates :email
    validates :password_digest
  end

  def save
    # Companyを保存
    company = Company.create(company_name: company_name, address: address)
    # Userを保存
    User.create(user_name: user_name, email: email, password_digest: password, company_id: company.id)
  end
end