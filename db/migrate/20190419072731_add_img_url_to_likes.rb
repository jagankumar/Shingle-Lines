class AddImgUrlToLikes < ActiveRecord::Migration[5.1]
  def change
    add_column :likes, :img_url, :string

  end
end
