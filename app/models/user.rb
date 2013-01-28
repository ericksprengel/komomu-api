class User < ActiveRecord::Base
  attr_accessible :email,
      :name,
      :fb_uid,
      :access_token,
      :mobile_token,
      :last_access
    
    
    has_many :communities, order: 'created_at desc'
    has_many :posts, :dependent => :destroy, order: 'created_at desc'
    has_many :user_likes_communities, :dependent => :destroy, order: 'created_at desc'
    has_many :user_likes_posts, :dependent => :destroy, order: 'created_at desc'
    has_many :user_likes_comments, :dependent => :destroy, order: 'created_at desc'
    
    validates :fb_uid, presence: true, uniqueness: true
    
    def self.auth_mobile_token(id, mobile_token)
      user = User.where(id: id).first
      return false if !user or ! (user.mobile_token.eql? mobile_token)
      user.last_access = DateTime.now
      user.save
      return user
    end

    def self.login_facebook(fb_uid, fb_access_token)
      fb_user = FbGraph::User.me(fb_access_token).fetch
      user = User.where(fb_uid: fb_uid).first || User.new
      
      if fb_user.identifier.eql? fb_uid
        if user.fb_uid.eql? fb_uid
          user.access_token = fb_access_token
          user.create_mobile_token
        else
          user = User.new(name: fb_user.name, email: fb_user.email, fb_uid: fb_uid, access_token: fb_access_token)
          user.create_mobile_token
        end
      else
        user.errors.add :uid, 'Invalid facebook login'
      end
      
      user
    end
    
    def sign_out    
      self.mobile_token = nil
      self.last_access = DateTime.now
      self.save
    end

    def create_mobile_token
      self.mobile_token = SecureRandom.urlsafe_base64
      self.last_access = DateTime.now
      self.save
    end
    
end
