class Search < ApplicationRecord
  validates :question, presence: true
  
  def self.websearch(input)
    "https://stackoverflow.com/questions/tagged/" + "#{input}".gsub!(/\s/,'+')
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
