class Search < ApplicationRecord
  

  def self.websearch(input)
    if input.scan(/\w+/).size <= 1
      "https://stackoverflow.com/search?q=" + '/questions/tagged/' + "#{input}"
    else
      "https://stackoverflow.com/search?q=" + "#{input}".gsub!(/\s/,'+')
    end
  end

  def self.pull_resaults(url)
    page_unparsed = HTTParty.get(url)
    page_parsed = Nokogiri::HTML(page_unparsed)
    list = Array.new
    listing = page_parsed.css('div.question-summary')

    listing.each do |val|
      res = {
        title:        val.css('a.question-hyperlink'),
        description:  val.css('div.excerpt'),
        url:          'https://stackoverflow.com' + val.css('a')[0].attributes['href'].value
      }
    list << res
    end
  end
end
