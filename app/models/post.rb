class Post < ActiveRecord::Base
  attr_accessible :description, :image, :title, :url, :likes, :user_id, :community_id
  belongs_to :user
  belongs_to :community

  has_many :comments, :dependent => :destroy, order: 'created_at desc'
  has_many :user_likes_posts, :dependent => :destroy, order: 'created_at desc'

  def relevance
    (self.likes + 0.5)/(((self.created_at - Time.now)/3600.0 + 2.0)**2)
  end

end
