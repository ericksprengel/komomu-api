class CreateUserLikesComments < ActiveRecord::Migration
  def change
    create_table :user_likes_comments do |t|
      t.integer :value
      t.integer :user_id
      t.integer :comment_id

      t.timestamps
    end
  end
end
