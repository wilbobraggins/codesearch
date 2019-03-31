class Search < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  def self.from_json(json)
    parsed_json = JSON.parse(json)

    new_search = self.new

    new_search.title       = parsed_json['title']
    new_search.description = parsed_json['description']
    new_search.url         = parsed_json['url']

    new_search
end
