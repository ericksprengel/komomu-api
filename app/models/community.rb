class Community < ActiveRecord::Base
  attr_accessible :image, :name, :description, :user_id, :likes
  attr_accessor :user_liked
  belongs_to :user
  
  has_many :posts, :dependent => :destroy, order: 'created_at desc'
  has_many :user_likes_communities, :dependent => :destroy, order: 'created_at desc'


  def set_current_user= (current_user)
    @like = self.user_likes_communities.where(user_id: current_user.id).first
    if @like.blank?
      self.user_liked =  0
    else
      self.user_liked = @like.value
    end
  end

  def as_json()
   super(:methods => :user_liked )
  end


end
