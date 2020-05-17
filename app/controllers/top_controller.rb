class TopController < ApplicationController
  def index
    @incomes = Income.includes(:user).order(income_date: :asc)
    @total_income_amount = @incomes.sum(:income_amount)
    @expenses = Expense.includes(:user).order(expense_date: :asc)
    @total_expense_amount = @expenses.sum(:expense_amount)
    @balance_payment = @total_income_amount - @total_expense_amount
    @wisdoms = Wisdom.includes(:user).all
    if @wisdoms.includes(:user).present?
      @random_wisdoms = Wisdom.order("RAND()").first
      @random_wisdoms_word = @random_wisdoms.word
      @random_wisdoms_author = @random_wisdoms.author
    end
  end
end
