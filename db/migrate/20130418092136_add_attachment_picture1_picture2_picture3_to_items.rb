class AddAttachmentPicture1Picture2Picture3ToItems < ActiveRecord::Migration
  def self.up
    change_table :items do |t|
      t.attachment :picture1
      t.attachment :picture2
      t.attachment :picture3
    end
  end

  def self.down
    drop_attached_file :items, :picture1
    drop_attached_file :items, :picture2
    drop_attached_file :items, :picture3
  end
end
