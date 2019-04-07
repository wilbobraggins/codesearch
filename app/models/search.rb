class Search < ApplicationRecord
  attr_accessor :answer

  def initialize
    @answer = answer
  end

  def websearch(search)
    url = 'https://stackoverflow.com'
    if "#{search}".scan(/\w+/).size <= 1
      url + '/questions/tagged/' + "#{search}"
    else
      url + '/search?q=' + "#{search}".gsub!(/\s/,'+')
    end
  end

  def searcher
    websearch(answer)
  end


class Resault 
require 'nokogiri'
require 'httparty'
require 'byebug'

attr_accessor :page_parsed, :page_unparsed, :list

  def initialize
    @page_unparsed = page_unparsed
    @page_parsed = page_parsed
    @list = list
  end



  def pull_resaults
    url = Search.new.searcher
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

