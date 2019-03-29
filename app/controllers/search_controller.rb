class SearchController < ApplicationController
 attr_accessor :answer
 helper_method :searches
  
  def index
  end

  def websearch(search)
    url = 'https://stackoverflow.com'
    if search.scan(/\w+/).size <= 1
      url + '/questions/tagged/' + "#{search}"
    else
      url + '/search?q=' + "#{search}".gsub!(/\s/,'+')
    end
  end

  def searches
    @answer = gets
    websearch(answer)
  end



end
