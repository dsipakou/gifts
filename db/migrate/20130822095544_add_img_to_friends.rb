class AddImgToFriends < ActiveRecord::Migration
  def change
    add_column :friends, :img, :string
  end
end
