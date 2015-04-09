class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :facebook_id
      t.string :facebook_token
      t.string :access_token
      t.string :name
      t.string :facebook_img
      t.string :device_token
      t.integer :university_id
      t.integer :status, default: 0, null: false

      t.timestamps
    end

    # add_index :users, [:facebook_id], name: "index_users_on_facebook_id", unique: true 
    # add_index :users, [:facebook_token], name: "index_users_on_facebook_token", unique: true 
    # add_index :users, [:access_token], name: "index_users_on_access_token", unique: true 

    # XXX: debug用にuniqueを一時的に外す    
    add_index :users, [:facebook_id], name: "index_users_on_facebook_id"
    add_index :users, [:facebook_token], name: "index_users_on_facebook_token" 
    add_index :users, [:access_token], name: "index_users_on_access_token" 
    
  end
end
