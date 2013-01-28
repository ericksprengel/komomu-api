class Api::PostsController < ApiController

  include Api::SessionsHelper

  before_filter :check_user_auth, only:[:index]
  
  def create
    params[:post][:likes] = 0
    if !current_user
      @user = @user = User.where(email: params[:post][:user_id]).first
      not_authorized if !@user
      params[:post][:user_id] = @user.id
      @community = Community.where(name: params[:post][:community_id]).first
      not_found if !@community
      params[:post][:community_id] = @community.id
      @post = Post.create(params[:post])
    else
      @post = current_user.posts.create(params[:post])
    end
  end

  def index
    case params[:type]
    when "news"
      puts "News!"
      @posts = Post.joins(:community => {:user_likes_communities => :user}).where(:user_likes_communities => {:user_id => current_user.id, :value => 1})
    when "hot"
      puts "Hot!"
      @posts = Post.joins(:community => {:user_likes_communities => :user}).where(:user_likes_communities => {:user_id => current_user.id, :value => 1}).sort do |p1, p2|
        p2.relevance <=> p1.relevance
      end
    else
      @posts = Post.joins(:community => {:user_likes_communities => :user}).where(:user_likes_communities => {:user_id => current_user.id, :value => 1})
    end
  end

  def show
    @post = Post.includes(:comments).find(params[:id].to_i)
  end
  
end
