class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :redirect_to_new_company, unless: :devise_controller?

  protected

  def redirect_to_new_company
    if current_user.present? && current_user.company.blank?
      redirect_to new_company_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up
    ) { |u| u.permit(:name, :email, :password) }
  end
end
