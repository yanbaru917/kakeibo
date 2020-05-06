class Expenses::SearchesController < ApplicationController
  def index
    @expenses = Expense.search(params[:year_month])
  end
end
