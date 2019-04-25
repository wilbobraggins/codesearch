class SearchController < ApplicationController
 
  
  def index
    @find = params[:q]
    if @find.blank?
      flash[:alert] = "Search for something"
    else
      @find = params[:q]
      url = "https://stackoverflow.com/search?q=" + @find
      page_unparsed = HTTParty.get(url)
      page_parsed = Nokogiri::HTML(page_unparsed)
      list = Array.new
      listing = page_parsed.css('div.question-summary')

      listing.each do |val|
          @res = {
            title:        val.css('a.question-hyperlink'),
            description:  val.css('div.excerpt'),
            url:          'https://stackoverflow.com' + val.css('a')[0].attributes['href'].value
          }
        list << @res 

      end
      @res.save
    end
  end
end
