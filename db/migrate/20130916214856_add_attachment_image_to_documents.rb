class AddAttachmentImageToDocuments < ActiveRecord::Migration
  def self.up
    change_table :documents do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :documents, :image
  end
end
