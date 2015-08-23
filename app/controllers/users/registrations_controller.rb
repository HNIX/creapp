class Users::RegistrationsController < Devise::RegistrationsController
  include ApplicationHelper
  layout "empty"
  before_filter :configure_permitted_parameters

  def create
    super
  end

  def new
    super
  end

  def edit
    super
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:first_name, :last_name, :industry_role, :checked_terms)
  end
end
