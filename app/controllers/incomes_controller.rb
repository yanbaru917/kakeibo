class IncomesController < ApplicationController

  def index
    @incomes = Income.order(income_date: :asc)
    @total_income_amount = @incomes.sum(:income_amount)
  end

  def show
    @income = Income.find(params[:id])
  end

  def new
    @income = Income.new()
  end

  def create
    Income.create(income_params)
    redirect_to root_path
  end

  def update
    income = Income.find(params[:id])
    income.update(income_params)
    redirect_to incomes_path
  end

  def edit
    @income = Income.find(params[:id])
  end

  def destroy
    @income = Income.find(params[:id])
    @income.destroy
    redirect_to incomes_path
  end

  private
  def income_params
    params.require(:income).permit(:income_name, :income_amount, :income_date)
  end

end
