class SearchController < ApplicationController
 
  
  def index
    if params[:q].blank?
      flash[:alert] = "Search for something"
    else
      @find = Search.parse(params)
    end
  end

end
