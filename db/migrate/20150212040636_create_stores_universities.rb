class CreateStoresUniversities < ActiveRecord::Migration
  def change
    create_table :stores_universities do |t|
      t.integer :store_id
      t.integer :university_id

      t.timestamps
    end
    add_index :stores_universities, [:store_id], name: "index_stores_universities_on_store_id" 
  end
end
