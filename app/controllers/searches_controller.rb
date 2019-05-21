class SearchesController < ApplicationController
 attr_accessor :question
  
  def index
    @search = Search.new(params[:question])
  end

  def create
    @search = Search.create(searches_params)
    @links = Search.websearch(@search.question)
    Search.create(link: "#{@links}")
      if @search.save
        redirect_to search_path(@search[:id])
      else
        flash[:alert] = "not working homie"
      end
  end
      

  def show
    @search = Search.find_by_id(params[:id])
    @url = Search.websearch(@search.question)
    @show = Search.pull_resaults(@url)
    @links = Search.websearch(@search.question)
  end

  private


  def searches_params
    params.require(:search).permit(:question)
  end

end
