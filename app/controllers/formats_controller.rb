class FormatsController < ApplicationController
  def index
    @formats = Company.all
  end

  def new
    @format = Company.new
  end

  def create
    @format = Company.create(format_params)
    redirect_to root_path
  end

  private

  def format_params
    params.require(:company).permit(:company_name, :address)
  end
end
