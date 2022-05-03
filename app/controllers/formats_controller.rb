class FormatsController < ApplicationController
  def index
    @formats = Company.includes(:user)
  end

  def new
    @format = CompanyUser.new
  end

  def create
    @format = CompanyUser.new(format_params)
    @format.save
    redirect_to root_path
    # company = Company.new(company_params)
    # User.create(user_params(company_id: company.id))
  end
  
  private

  def format_params
    params.require(:company_user).permit(:company_name, :address, :user_name, :email, :password, :password_confirmation)
  end
  # def company_params
  #   params.permit(:company_name, :address)
  # end
  # def user_params
  #   params.permit(:user_name, :email, :password, :password_confirmation).merge(company_id: company.id)
  # end
end
