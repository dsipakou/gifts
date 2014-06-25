class AddSimilarToToItems < ActiveRecord::Migration
  def change
    add_column :items, :similar_to, :string
  end
end
