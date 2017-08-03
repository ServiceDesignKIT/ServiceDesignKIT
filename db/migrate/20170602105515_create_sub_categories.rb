class CreateSubCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :sub_categories do |t|
      t.string :name
      t.references :category, foreign_key: true

      t.timestamps
    end
    # add_index :categories, [:category_id]
  end
end
