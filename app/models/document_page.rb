class DocumentPage < ActiveRecord::Base
  attr_accessible :number, :page_image
  belongs_to :document
  has_attached_file :page_image
end
