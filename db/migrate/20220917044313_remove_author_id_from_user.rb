class RemoveAuthorIdFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :AuthorId, :integer
  end
end
