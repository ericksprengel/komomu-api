class Post < ActiveRecord::Base
  attr_accessible :description, :image, :title, :url, :user_id, :community_id
  belongs_to :user
  belongs_to :community
end
