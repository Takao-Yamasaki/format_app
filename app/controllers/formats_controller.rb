class FormatsController < ApplicationController
  def index
    @formats = Company.includes(:user)
    # ブレークポイントの設置
    # binding.pry
  end

  def new
    @format = CompanyUser.new
  end

  def create
    @format = CompanyUser.new(format_params)
    @format.save
    redirect_to root_path
  end
  
  private

  def format_params
    params.require(:company_user).permit(:company_name, :address, :user_name, :email, :password, :password_confirmation)
  end
end
