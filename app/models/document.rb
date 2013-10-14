class Document < ActiveRecord::Base
  require 'RMagick'
  attr_accessible :category, :description, :title, :pdf, :image
  has_attached_file :pdf
  has_attached_file :image
  has_many :document_pages
  #after_save :generate_pages
  
  def generate_pages
    unless self.pdf.path.blank?
      pdf = RGhost::Convert.new(self.pdf.path)
      images = pdf.to :png, :multipage => true, :resolution => 300
      images.each do |img|
        self.document_pages.create(:number => img.gsub(/.*_/, "").gsub(/\.png/, "").to_i, :page_image => File.new("#{img}", "r"))
      end
    end
  end
  
end
