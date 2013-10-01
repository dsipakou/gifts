class AddArticlenumToItems < ActiveRecord::Migration
  def change
    add_column :items, :article, :integer
  end
end
