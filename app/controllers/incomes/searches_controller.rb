class Incomes::SearchesController < ApplicationController
  def index
    @incomes = Income.search(params[:search_date])
  end
end
