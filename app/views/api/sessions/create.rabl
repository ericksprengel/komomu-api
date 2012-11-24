object @user => :user

attributes :id, :name, :email, :mobile_token, :created_at, :last_access

node :errors do | u |
	u.errors
end
