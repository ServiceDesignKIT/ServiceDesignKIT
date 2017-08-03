class AddNewColumsToUserAndPostTables < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :status, :integer, default: 0
    add_column :users, :role, :integer, default: 0
  end
end
