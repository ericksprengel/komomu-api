object @like

attributes :id, :user_id, :community_id, :value, :created_at

node :errors do | u |
	u.errors
end
