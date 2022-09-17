class Rename < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :AuthorId, :user_id
    rename_column :likes, :AuthorId, :user_id
    rename_column :posts, :AuthorId, :user_id
  end
end
