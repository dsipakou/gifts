class CreateAdminItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :category_id
      t.integer :price
      t.string :picture1
      t.string :picture2
      t.string :picture3
      t.string :title
      t.text :desc
      t.boolean :availability
      t.boolean :showonmain
      t.timestamps
    end
  end
end
