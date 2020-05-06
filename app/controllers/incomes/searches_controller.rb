class Incomes::SearchesController < ApplicationController
  def index
    @incomes = Income.search(params[:year_month])
  end
end
