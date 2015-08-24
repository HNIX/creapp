class UsersController < ApplicationController
  load_and_authorize_resource
  def edit
    @role = params[:industry_role]
    @checked_terms = current_user.checked_terms_was
  end

  def update
    if current_user.update(user_params)
      flash[:notice] = 'Your information has been updated.'
      if params[:create_investor].present?
        UserMailer.welcome_email(current_user).deliver
        redirect_to edit_user_investor_path(@user)
      elsif params[:create_client].present?
        UserMailer.welcome_email(current_user).deliver
        redirect_to new_user_client_path(@user)
      else
        render :edit
      end
    else
      flash[:alert] = 'Your information could not be updated.'
      render :edit
    end
  end

  private

  def user_params
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password_confirmation].blank?
    params.require(:user).permit(:industry_role, :picture, :first_name, :last_name, :email, :password, :password_confirmation, :checked_terms)
  end
end