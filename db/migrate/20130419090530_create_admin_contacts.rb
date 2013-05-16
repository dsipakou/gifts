class CreateAdminContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :phone1
      t.string :phone2
      t.string :email1
      t.string :email2
      t.string :url1
      t.string :url2
      t.string :url3
      t.string :skype
      t.string :name
      t.text :aboutus

      t.timestamps
    end
  end
end
