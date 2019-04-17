class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.integer :count
      t.string :image_name
      t.timestamps
    end
  end
end
