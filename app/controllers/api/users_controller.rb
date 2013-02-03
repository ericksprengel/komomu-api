class Api::UsersController < ApiController

  before_filter :check_user_auth, only:[:show]
  
  def show
    @user = current_user
  end
end
