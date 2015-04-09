class CreateUsersCoupons < ActiveRecord::Migration
  def change
    create_table :users_coupons do |t|
      t.integer :user_id
      t.integer :coupon_id
      t.integer :status, default: 0, null: false

      t.timestamps
    end
    add_index :users_coupons, [:user_id], name: "index_users_coupons_on_user_id" 
  end
end
