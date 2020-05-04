class IncomesController < ApplicationController

  def index
    @incomes = Income.order(created_at: :asc)
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
    
  end

  def edit
    @income = Income.find(params[:id])
  end

  def destroy
    @income = Income.find(params[:id])
    @income.destroy
  end

  private
  def income_params
    params.require(:income).permit(:income_name, :income_amount)
  end
end
