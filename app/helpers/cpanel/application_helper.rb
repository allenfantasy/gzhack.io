module Cpanel::ApplicationHelper
  def user_signed_in?
    session[:username].present?
  end
end
