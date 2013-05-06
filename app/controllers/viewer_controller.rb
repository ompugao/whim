class ViewerController < ApplicationController

  def index
    respond_to do |format|
      format.html
      format.json { render :json => ''}
    end
  end

  def new
    respond_to do |format|
      format.html
      format.json { render :json => ''}
    end
  end

  def create
    respond_to do |format|
      format.html
      format.json { render :json => ''}
    end
  end

  def show
    file_path = CGI.unescape(params[:id])
    @gitfile = ::GitFile.new(file_path + '.' + params[:format])
    respond_to do |format|
      format.html
      format.markdown
      format.mkd 
      format.md 
      format.page 
    end
  end

  def edit
    file_path = CGI.unescape(params[:id])
    @gitfile = ::GitFile.new(file_path + '.' + params[:format])
    @default_commitlog = "update " + @gitfile.path
    respond_to do |format|
      format.html
      format.markdown
      format.mkd 
      format.md 
      format.page 
    end
  end

  def update
    file_path = CGI.unescape(params[:id])
    @gitfile = ::GitFile.new(file_path + '.' + params[:format])
    @gitfile.data = params[:gitfile][:data]
    @gitfile.save params[:gitfile][:commitlog]
    respond_to do |format|
      format.html
      format.markdown
      format.mkd 
      format.md 
      format.page 
    end
  end

  def destroy
    respond_to do |format|
      format.html
      format.json { render :json => ''}
    end
  end

end
# vim: set ft=ruby ts=2 sw=2:
