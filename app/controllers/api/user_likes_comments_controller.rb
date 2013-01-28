class Api::UserLikesCommentsController < ApiController
  
  before_filter :check_user_auth, only:[:create]

  def create
    @comment = Comment.where(id: params[:comment_id]).first
    @likes = UserLikesComment.where(user_id: current_user.id, comment_id: @comment.id)
    if @likes.blank?
      @like = UserLikesComment.create(user_id: current_user.id, comment_id: @comment.id, value: params[:value].to_i)
      @comment.likes = @comment.likes + @like.value
    else
      @like = @likes.first
      @comment = Comment.where(id: params[:comment_id]).first
      @comment.likes = @comment.likes + params[:value].to_i - @like.value
      @like.value = params[:value].to_i
      @like.save
    end
    @comment.save

  end
end
