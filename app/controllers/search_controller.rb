class SearchController < ApplicationController

  def index
    @find = websearch(search)
  end

  def websearch(search)
    url = 'https://stackoverflow.com'
    if search.scan(/\w+/).size <= 1
      url + '/questions/tagged/' + "#{search}"
    else
      url + '/search?q=' + "#{search}".gsub!(/\s/,'+')
    end
    redirect_to(websearch(search)) 
  end

end
