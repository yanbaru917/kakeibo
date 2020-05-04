class ExpensesController < ApplicationController
  
  def index
    @expenses = Expense.order(expense_date: :asc)
    @total_expense_amount = @expenses.sum(:expense_amount)
  end

  def show
    @income = Income.find(params[:id])
  end

  def new
    @expense = Expense.new()
  end

  def create
    Expense.create(expense_params)
    redirect_to root_path
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    expense = Expense.find(params[:id])
    expense.update(expense_params)
    redirect_to expenses_path
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
    redirect_to expenses_path
  end

  private
  def expense_params
    params.require(:expense).permit(:expense_name, :expense_amount, :expense_date)
  end
end
