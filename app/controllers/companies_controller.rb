class CompaniesController < ApplicationController
  skip_before_action :redirect_to_new_company, only: [:new, :create]

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:success] = "Company has been created"
      assign_user(@company.id)
      redirect_to company_path(@company)
    else
      render 'new'
    end
  end

  def show
    @company = current_user.company
  end

  def edit
    @company = current_user.company
  end

  def update
    @company = current_user.company
    if @company.update(company_params)
      flash[:success] = "Company updated"
      redirect_to company_path(@company)
    else
      render 'edit'
    end
  end

  private

  def assign_user(company_id)
    current_user.update(company_id: company_id)
  end

  def company_params
    params.require(:company).permit(:name, :vatcode, :address, :city, :postcode)
  end
end
