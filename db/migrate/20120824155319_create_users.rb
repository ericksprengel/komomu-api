class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :fb_uid, null: false, unique:true
      t.string :name
      t.string :access_token
      t.string :mobile_token
      t.datetime :last_access

      t.timestamps
    end
  end
end
