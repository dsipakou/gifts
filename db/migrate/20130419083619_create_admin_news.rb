class CreateAdminNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.text :content
      t.string :date
      t.boolean :main

      t.timestamps
    end
  end
end
