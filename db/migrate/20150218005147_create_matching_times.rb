class CreateMatchingTimes < ActiveRecord::Migration
  def change
    create_table :matching_times do |t|
      t.integer :matching_id
      t.integer :user_id
      t.datetime :from
      t.datetime :to

      t.timestamps
    end
  end
end
