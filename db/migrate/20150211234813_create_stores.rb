class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.text :description
      t.text :address
      t.string :latitude
      t.string :longitude
      t.string :url
      t.string :tel
      t.string :store_image_url

      t.timestamps
    end
  end
end
