class TopController < ApplicationController
  def index
    @incomes = Income.order(income_date: :asc)
    @total_income_amount = @incomes.sum(:income_amount)
    @expenses = Expense.order(expense_date: :asc)
    @total_expense_amount = @expenses.sum(:expense_amount)
    @balance_payment = @total_income_amount - @total_expense_amount
    @wisdom = Wisdom.all
  end
end
