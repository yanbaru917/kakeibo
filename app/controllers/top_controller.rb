class TopController < ApplicationController
  def index
    @incomes = Income.includes(:user)
    @total_income_amount = @incomes.sum(:income_amount)
    @expenses = Expense.includes(:user)
    @total_expense_amount = @expenses.sum(:expense_amount)
    @balance_payment = @total_income_amount - @total_expense_amount
    @wisdoms = Wisdom.includes(:user).all
    if @wisdoms.includes(:user).present?
      rand = Rails.env.production? ? "RANDOM()" : "rand()"
      @random_wisdoms = Wisdom.order(rand).first
      @random_wisdoms_word = @random_wisdoms.word
      @random_wisdoms_author = @random_wisdoms.author
    end
  end
end
