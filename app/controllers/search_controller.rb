class SearchController < ApplicationController
 
  
  def index

  end

  def create
    @answer = Search.new
    redirect_to show_path
  end

  def show
  Resaults.new.pull_resaults 
  end

end
