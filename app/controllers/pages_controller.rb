class PagesController < ApplicationController

  def index
    @file_content = self.class.helpers.mkd2html(::GitFile.new(Settings.default_page_name).data).html_safe
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
    file_path = self.class.helpers.unescape_path(params[:gitfile][:path])
    @gitfile = ::GitFile.new(file_path)
    @gitfile.data = params[:gitfile][:data] 
    @gitfile.save params[:gitfile][:commitlog]

    params[:format] = File.extname(params[:gitfile][:path])[1..-1].intern
    respond_to do |format|
      format.html
      format.json { render :json => ''}
      format.markdown
      format.mkd 
      format.md 
      format.page 
    end
  end

  def show
    file_path = self.class.helpers.unescape_path(params[:id])
    @gitfile = ::GitFile.new(file_path + '.' + params[:format])
    respond_to do |format|
      format.html
      format.markdown
      format.mkd 
      format.md 
      format.page 
      format.jpg  { send_data @gitfile.data, :type=>:jpg, :disposition=>'inline' }
      format.png  { send_data @gitfile.data, :type=>:png, :disposition=>'inline' }
      format.pdf  { send_file File.join(Settings.git_repo_path,file_path + '.' + params[:format])}
    end
  end

  def edit
    file_path = self.class.helpers.unescape_path(params[:id])
    unless file_path == ""
      @gitfile = ::GitFile.new(file_path + '.' + params[:format])
    else
      @gitfile = ::GitFile.new(Settings.default_page_name)
    end
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
    file_path = self.class.helpers.unescape_path(params[:id])
    @gitfile = ::GitFile.new(file_path + '.' + params[:format])
    @gitfile.data = params[:gitfile][:data]
    @gitfile.save params[:gitfile][:commitlog]
    # reload file
    @gitfile = ::GitFile.new(file_path + '.' + params[:format])
    respond_to do |format|
      format.html
      format.markdown
      format.mkd 
      format.md 
      format.page 
    end
  end

  def destroy
    file_path = self.class.helpers.unescape_path(params[:id])
    @gitfile = ::GitFile.new(file_path + '.' + params[:format])
    @gitfile.delete("delete " + @gitfile.path)
    respond_to do |format|
      format.html
      format.json { render :json => ''}
    end
  end

end
# vim: set ft=ruby ts=2 sw=2:
