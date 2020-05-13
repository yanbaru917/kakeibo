class ExpensesController < ApplicationController
  
  def index
    @expenses = Expense.order(expense_date: :desc).page(params[:page]).per(15)
    @total_expense_amount = @expenses.sum(:expense_amount)
    @group_expenses = Expense.group(:expense_name).sum(:expense_amount)
    @group_expenses_sort = @group_expenses.sort {|(k1, v1), (k2, v2)| v2 <=> v1 }.to_h
  end
  
  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      redirect_to expenses_path, notice: '支出を登録しました'
    else
      render :new
    end
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    @expense = Expense.find(params[:id])
    if @expense.update(expense_params)
      redirect_to expenses_path, notice: '支出を更新しました'
    else
      render :edit
    end
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
