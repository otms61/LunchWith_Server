class CreateFriendShips < ActiveRecord::Migration
  def change
    create_table :friend_ships do |t|
    	t.integer :user_id
    	t.integer :friend_id

      t.timestamps
    end
    add_index :friend_ships, [:user_id], name: "index_friend_ships_on_user_id" 
  end
end
