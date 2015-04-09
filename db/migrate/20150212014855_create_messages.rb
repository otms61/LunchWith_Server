class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :matching_id
      t.integer :user_id
      t.integer :sequential_id
      t.text :message
      
      t.timestamps
    end
    add_index :messages, [:sequential_id], name: "index_messages_on_facebook_id"
    add_index :messages, [:matching_id], name: "index_messages_on_matching_id" 
  end
end
