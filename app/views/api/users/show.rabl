Rabl.configure do |config|
  config.include_child_root = false
end
object @user

attributes :id, :name, :email, :points, :created_at
child(:posts) { attributes :id, :url, :description, :title, :created_at, :image, :user_id, :relevance, :likes }

