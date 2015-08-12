class UserMailer < ActionMailer::Base
  # rhc2104: If I get spammed, it's a great problem to have, I guess...
  default from: 'admin@creconsole.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to CodeDoor')
  end

  def message_sent(user, asset, message, other_user, asset_started)
    @user = user
    @asset = asset
    @message = message
    @other_user = other_user
    @asset_started = asset_started

    message = asset_started ? "Contract offered from #{@other_user.full_name}" : "Message from #{@other_user.full_name}"

    mail(to: @user.email, subject: message)
  end

  def state_occurred_to_asset(user, asset, other_user, action_name)
    @user = user
    @asset = asset
    @other_user = other_user
    @action_name = action_name
    mail(to: @user.email, subject: "Asset has been #{action_name.to_s}")
  end

end