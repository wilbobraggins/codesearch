class SearchController < ApplicationController
 
  
  def index
    @searches = Search.all
    @searches = Search.new
  end

  def create
    @searches = Search.new(params[:question])
    @searches.searches.create
  end
      

  def show
    @search = Search.find(params[:id])
  end

  private

  def question_params
    params.require(:search).permit(:question)
  end

end
