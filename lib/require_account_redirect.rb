module RequireAccountRedirect
  protected

  # Redirects for users that haven't finished signing up for their client/investor account
  def ensure_user_checked_terms
    account_required(nil)
  end

  def client_required
    account_required(:client)
  end

  def investor_required
    account_required(:investor)
  end

  def client_or_investor_required
    account_required(:client_or_investor)
  end

  def account_required(account)
    path = next_path_for_account(account)
    redirect_because_account_incomplete(path, account) if path
  end

  def next_path_for_account(account)
    if current_user.nil?
      login_path
    elsif !current_user.checked_terms?
      edit_user_path(current_user)
    elsif (account == :client) && current_user.client.nil?
      new_user_client_path(current_user)
    elsif (account == :investor) && !current_user.completed_investor_account?
      edit_user_investor_path(current_user)
    elsif (account == :client_or_investor) && current_user.client.nil? && !current_user.completed_investor_account?
      # It's not obvious which account the user should redirect to, so use the heuristic that if they
      # clicked "Create investor Account", that they should finish building that account.
      current_user.investor.present? ? edit_user_investor_path(current_user) : new_user_client_path(current_user)
    end
  end

  def redirect_because_account_incomplete(path, account_type)
    if account_type == :client
      cookies[:after_client_signed_up_path] = request.fullpath
    elsif account_type == :investor
      cookies[:after_investor_signed_up_path] = request.fullpath
    else
      cookies[:after_account_signed_up_path] = request.fullpath
    end
    redirect_to path
  end

  # Redirect back to the page that forced the user to finish their account creation
  def client_signed_up_path
    path_from_cookie(:after_account_signed_up_path) || path_from_cookie(:after_client_signed_up_path) || investors_path
  end

  def investor_signed_up_path
    path_from_cookie(:after_account_signed_up_path) || path_from_cookie(:after_investor_signed_up_path) || investor_path(current_user.investor)
  end

  def path_from_cookie(key)
    path = nil
    if cookies[key]
      path = cookies[key]
      cookies.delete(key)
    end
    path
  end
end