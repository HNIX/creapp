class Users::SessionsController < Devise::SessionsController
  include ApplicationHelper
  layout "sign_up"

  def create
    super
  end

  def new
    super
  end
end
