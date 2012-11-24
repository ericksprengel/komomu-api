class Community < ActiveRecord::Base
  attr_accessible :image, :name, :description, :user_id
  belongs_to :user
  
  has_many :posts, :dependent => :destroy, order: 'created_at desc'

end
