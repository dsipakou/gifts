class AddSubcatToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :subcategory, :integer
  end
end
