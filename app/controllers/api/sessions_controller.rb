class Api::SessionsController < ApiController

  def create
      @user = User.login_facebook(params[:credentials][:fb_uid], params[:credentials][:fb_token])
  end

  def destroy
    @success = current_user.sign_out
  end
  
end
