class Api::PostsController < ApiController

  before_filter :check_user_auth, only:[:create, :index]
  
  def create
    @post = current_user.posts.create(params[:post])
  end

  def index
    @posts = Post.where(params[:community])
  end
  
end
