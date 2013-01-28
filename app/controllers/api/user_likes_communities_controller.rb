class Api::UserLikesCommunitiesController < ApiController
  
  before_filter :check_user_auth, only:[:create]

  def create
    @community = Community.where(id: params[:community_id]).first
    @likes = UserLikesCommunity.where(user_id: current_user.id, community_id: @community.id)
    if @likes.blank?
      @like = UserLikesCommunity.create(user_id: current_user.id, community_id: @community.id, value: params[:value].to_i)
      @community.likes = @community.likes + @like.value
    else
      @like = @likes.first
      @community = Community.where(id: params[:community_id]).first
      @community.likes = @community.likes + params[:value].to_i - @like.value
      @like.value = params[:value].to_i
      @like.save
    end
    @community.save
  end

end
