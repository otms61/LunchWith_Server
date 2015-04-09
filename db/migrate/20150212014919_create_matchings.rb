class CreateMatchings < ActiveRecord::Migration
  def change
    create_table :matchings do |t|
      t.integer :coupon_id
      t.integer :user1_id
      t.integer :user2_id
      t.datetime :from
      t.datetime :to
      t.timestamps
    end
    add_index :matchings, [:coupon_id], name: "index_matchings_on_coupon_id" 
    add_index :matchings, [:user1_id], name: "index_matchings_on_user1_id" 
    add_index :matchings, [:user2_id], name: "index_matchings_on_user2_id" 
  end
end
