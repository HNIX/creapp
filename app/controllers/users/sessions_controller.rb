class Users::SessionsController < Devise::SessionsController
  include ApplicationHelper
  layout "empty"

  def create
    super
  end

  def new
    super
  end
end
