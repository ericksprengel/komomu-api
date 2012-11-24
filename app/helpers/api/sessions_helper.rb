module Api::SessionsHelper

  def current_user=(user)
      @current_user = user
  end

  def current_user
      @current_user ||= User.auth_mobile_token request.headers["user_id"], request.headers["mobile_token"]
  end
  
end
