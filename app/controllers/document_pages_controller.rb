class DocumentPagesController < ApplicationController
  # GET /document_pages
  # GET /document_pages.json
  def index
    @document_pages = DocumentPage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @document_pages }
    end
  end

  # GET /document_pages/1
  # GET /document_pages/1.json
  def show
    @document_page = DocumentPage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @document_page }
    end
  end

  # GET /document_pages/new
  # GET /document_pages/new.json
  def new
    @document_page = DocumentPage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @document_page }
    end
  end

  # GET /document_pages/1/edit
  def edit
    @document_page = DocumentPage.find(params[:id])
  end

  # POST /document_pages
  # POST /document_pages.json
  def create
    @document_page = DocumentPage.new(params[:document_page])

    respond_to do |format|
      if @document_page.save
        format.html { redirect_to @document_page, notice: 'Document page was successfully created.' }
        format.json { render json: @document_page, status: :created, location: @document_page }
      else
        format.html { render action: "new" }
        format.json { render json: @document_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /document_pages/1
  # PUT /document_pages/1.json
  def update
    @document_page = DocumentPage.find(params[:id])

    respond_to do |format|
      if @document_page.update_attributes(params[:document_page])
        format.html { redirect_to @document_page, notice: 'Document page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @document_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /document_pages/1
  # DELETE /document_pages/1.json
  def destroy
    @document_page = DocumentPage.find(params[:id])
    @document_page.destroy

    respond_to do |format|
      format.html { redirect_to document_pages_url }
      format.json { head :no_content }
    end
  end
end
