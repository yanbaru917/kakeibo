class Expenses::SearchesController < ApplicationController
  def index
    @expenses = Expense.search(params[:search_date])
  end
end
