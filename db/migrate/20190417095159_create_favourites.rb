class CreateFavourites < ActiveRecord::Migration[5.1]
  def change
    create_table :favourites do |t|
      t.string :img_url
      t.integer :user_id
      t.string :image_name

      t.timestamps
    end
  end
end
