class Search < ApplicationRecord
  validates :question, presence: true
  
  def self.search(searches)
    "https://stackoverflow.com/questions/tagged/" + "#{searches}".gsub!(/\s/,'+')
  end
end
