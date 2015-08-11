class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include RequireAccountRedirect
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound do |exception|
    redirect_cannot_be_found
  end

  def main
    @custom_description = 'CodeDoor is a marketplace for freelance programmers that have contributed to open source software.'
    render('/landings/loggedout') unless current_user.present?
  end

  def after_sign_in_path_for(resource)
    if cookies[:after_client_signed_up_path].present?
      next_path_for_account(:client) || path_from_cookie(:after_client_signed_up_path)
    elsif cookies[:after_investor_signed_up_path].present?
      next_path_for_account(:investor) || path_from_cookie(:after_investor_signed_up_path)
    else
      next_path_for_account(:client_or_investor) || path_from_cookie(:after_account_signed_up_path) || root_path
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

  # def devise_parameter_sanitizer
  #   if resource_class == User
  #     User::ParameterSanitizer.new(User, :user, params)
  #   else
  #     super # Use the default one
  #   end
  # end

end



