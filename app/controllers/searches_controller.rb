class SearchesController < ApplicationController
 attr_accessor :question
  
  def index
    @search = Search.new
  end

  def create
    @search = Search.new(searches_params)
      if @search.save
        redirect_to search_path(@search[:id])
      else
        flash[:alert] = "not working homie"
      end
  end
      

  def show
    @search = Search.last
  end

  private

  def searches_params
    params.require(:search).permit(:question)
  end

end
