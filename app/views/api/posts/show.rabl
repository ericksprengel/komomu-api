Rabl.configure do |config|
  config.include_child_root = false
end
object @post

attributes :id, :description, :image, :title, :url, :user_id, :community_id, :likes, :created_at
child(:comments) { attributes :id, :text, :user_id, :created_at }

