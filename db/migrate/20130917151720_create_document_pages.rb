class CreateDocumentPages < ActiveRecord::Migration
  def change
    create_table :document_pages do |t|
      t.integer :number
      t.belongs_to :document
      t.timestamps
    end
  end
end
