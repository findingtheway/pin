class AddAttachmentImageToDots < ActiveRecord::Migration
  def self.up
    change_table :dots do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :dots, :image
  end
end
