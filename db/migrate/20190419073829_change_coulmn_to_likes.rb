class ChangeCoulmnToLikes < ActiveRecord::Migration[5.1]
  def change
    add_column :likes, :like_count, :integer


  end
end
