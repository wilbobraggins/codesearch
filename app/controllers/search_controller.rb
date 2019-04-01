class SearchController < ApplicationController
 
  
  def index
    redirect_to Search.websearch(search)
  end

end
