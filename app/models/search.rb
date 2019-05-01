class Search < ApplicationRecord
  
  def self.weburl(input)
    url = "https://stackoverflow.com/questions/tagged/" + "#{input}".gsub!(/\s/,'+')
  end
end
