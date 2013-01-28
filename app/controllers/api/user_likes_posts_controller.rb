class Api::UserLikesPostsController < ApiController
  
  before_filter :check_user_auth, only:[:create]

  def create
    @post = Post.where(id: params[:post_id]).first
    @likes = UserLikesPost.where(user_id: current_user.id, post_id: @post.id)
    if @likes.blank?
      @like = UserLikesPost.create(user_id: current_user.id, post_id: @post.id, value: params[:value].to_i)
      @post.likes = @post.likes + @like.value
    else
      @like = @likes.first
      @post = Post.where(id: params[:post_id]).first
      @post.likes = @post.likes + params[:value].to_i - @like.value
      @like.value = params[:value].to_i
      @like.save
    end
    @post.save

  end
end
