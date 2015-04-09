class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.integer :store_id
      t.integer :university_id
      t.text :contents
      t.integer :status, default: 0, null: false
      t.datetime :limit
      t.datetime :usage_time_from
      t.datetime :usage_time_to

      t.timestamps
    end
    add_index :coupons, [:store_id], name: "index_coupons_on_store_id" 
    add_index :coupons, [:status], name: "index_coupons_on_status" 
  end
end
