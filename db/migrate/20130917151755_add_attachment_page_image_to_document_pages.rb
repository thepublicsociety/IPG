class AddAttachmentPageImageToDocumentPages < ActiveRecord::Migration
  def self.up
    change_table :document_pages do |t|
      t.attachment :page_image
    end
  end

  def self.down
    drop_attached_file :document_pages, :page_image
  end
end
