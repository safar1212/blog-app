class Rename < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :post_id, :PostId
    rename_column :likes, :post_id, :PostId
  end
end
