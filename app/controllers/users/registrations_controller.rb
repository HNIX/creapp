class Users::RegistrationsController < Devise::RegistrationsController
  include ApplicationHelper
  layout "sign_up"

  def create
    super
  end

  def new
    super
  end

  def edit
    super
  end
end
