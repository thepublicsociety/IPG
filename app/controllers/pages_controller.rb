class PagesController < ApplicationController
  before_filter :authorize_or_redirect, :only => :admin

  def admin
    @bodyclass = "admin"
    @title = "Website :: Administration"
    @metatag = "Administration homepage for website"
  end

  def index
    @emails = []
    hash = {"email" => "test@test.com", "name" => "test"}
    s = OpenStruct.new hash
    @emails.push(s)
    @message = Message.new
  end
  
  def upload
    @document = Document.new
  end
  def add_image
    doc = Document.find(params[:id])
    n = params[:qqfile].gsub(/^(.*)_/, "").gsub(".png", "")
    @image = doc.document_pages.create(:number => n, :page_image => params[:file]) unless params[:file].blank?
    if @image.save
      render :text => '{success:true}'
    end
  end
  
  def search
    query = params[:query]
    @documents = Document.where("title like ? or category like ? or description like ?", "%#{query}%", "%#{query}%", "%#{query}%")
  end
  
  def article
    @doc = Document.find(params[:id])
  end
  
  def send_mail
  	@message = Message.new(params[:message])
  	email = params[:email]
  	subject = params[:subject]
  	sender = params[:from]
  	SendMail.email(sender, email, subject, @message).deliver
  	redirect_to website_path, :notice => "Email was delivered"
  end
  
end
