class ApiController < ApplicationController
  def markdown2html
    @ret = {}
    @ret[:html] =  self.class.helpers.mkd2html(params[:markdown])
    respond_to do |format|
      format.json {render :json => @ret}
    end
  end
end
