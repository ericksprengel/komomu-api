class Api::CommunitiesController < ApiController

  def create
    @community = Community.create(params[:community])
  end

  def index
    @communities = []
    ('A'..'Z').each do |letra|
#      @communities << { letra => Community.where("name LIKE '#{letra}%'").where(:user_id => current_user.user_id) }
      @communities << { letra => Community.where("name LIKE '#{letra}%'").where(:user_id => 1) }        
    end
    render json: {communities:@communities}, status: 200
  end

  def show
    @community = Community.includes(:posts).find(params[:id].to_i)
  end
end
