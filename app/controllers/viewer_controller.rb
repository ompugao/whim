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
    @file_path = CGI.unescape(params[:id])
    @file_data = @repo.file_data(@file_path)
    respond_to do |format|
      format.html
      format.markdown
      format.mkd {render 'markdown'}
      format.md {render 'markdown'}
      format.md {render 'page'}
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.json { render :json => ''}
    end
  end

  def update
    respond_to do |format|
      format.html
      format.json { render :json => ''}
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
