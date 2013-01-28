class CreateUserLikesCommunities < ActiveRecord::Migration
  def change
    create_table :user_likes_communities do |t|
      t.integer :value
      t.integer :user_id
      t.integer :community_id

      t.timestamps
    end
  end
end
