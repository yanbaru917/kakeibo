class Expenses::SearchesController < ApplicationController
  def index
    @expenses = Expense.search(params[:start_date],params[:end_date])
  end
end
