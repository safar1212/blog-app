class AddDefaultContraintsToUser < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :PostsCounter, false
    change_column_default :users, :PostsCounter, 0
  end
end
