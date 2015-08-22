class Users::PasswordsController < Devise::PasswordsController
  include ApplicationHelper
  layout "sign_up"

  def new
    super
  end
end
