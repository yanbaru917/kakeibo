class ExpensesController < ApplicationController
  
  def index
    @expenses = Expense.order(created_at: :asc)
  end

  def new
    @expense = Expense.new 
  end

  def edit
    @expense = Expense.find(params[id])
  end

  def created
  
  end
end
