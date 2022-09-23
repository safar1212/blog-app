class RemovePostIdFromPost < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :PostId, :integer
  end
end
