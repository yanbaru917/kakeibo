class Incomes::SearchesController < ApplicationController
  def index
    @incomes = Income.search(params[:start_date],params[:end_date]) 
  end
end
