class Api::CommentsController < ApiController

  before_filter :check_user_auth, only:[:create]

  def create
    @comment = current_user.comments.create(params[:comment])
  end

end
