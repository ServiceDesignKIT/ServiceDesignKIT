class AddInstructionToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :instruction, :text
  end
end
