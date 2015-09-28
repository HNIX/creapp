class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include RequireAccountRedirect
  protect_from_forgery with: :exception

  check_authorization
  skip_authorization_check

  before_filter :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActiveRecord::RecordNotFound do |exception|
    redirect_cannot_be_found
  end

  def main
    @custom_description = 'CREConsole is a marketplace for commercial real estate.'
    render('/landings/index') unless current_user.present?
    if current_user.present?
      render layout: "application"
    end

  end

  def after_sign_in_path_for(resource)
    if cookies[:after_account_signed_up_path].present?
      path_from_cookie(:after_account_signed_up_path) || root_path
    end
  end

  private

  
  #-> Prelang (user_login:devise)
  def require_user_signed_in
    unless user_signed_in?
      # If the user came from a page, we can send them back.  Otherwise, send
      # them to the root path.
      if request.env['HTTP_REFERER']
        fallback_redirect = :back
      elsif defined?(root_path)
        fallback_redirect = root_path
      else
        fallback_redirect = "/"
      end

      redirect_to fallback_redirect, flash: {error: "You must be signed in to view this page."}
    end
  end
  def redirect_cannot_be_found
    redirect_to root_url, alert: 'Information cannot be found.'
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :first_name << :last_name << :checked_terms
  end

end



