class Api::CommunitiesController < ApiController

  before_filter :check_user_auth, only:[:create, :index, :show]
  
  def create
    params[:community][:likes] = 0
    @community = current_user.communities.create(params[:community])
  end

  def index
    @communities = []
    ('A'..'Z').each do |letra|
      comus = Community.where("name LIKE '#{letra}%'").each do |comu|
        comu.set_current_user= current_user
      end
      @communities << { letra => comus }
    end
    render json: {communities:@communities.as_json}
  end

  def show
    @community = Community.includes(:posts).where(id: params[:id].to_i).first
    @community.set_current_user= current_user
    case params[:type]
    when "news"
      puts "News!"
      #nothing to do!
    when "hot"
      puts "Hot!"
      @community.posts.sort! do |p1, p2|
        p2.relevance <=> p1.relevance
      end
    else
      #nothing to do! order as 'news'
    end
  end

end
