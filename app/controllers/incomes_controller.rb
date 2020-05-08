class IncomesController < ApplicationController

  def index
    @incomes = Income.order(income_date: :asc)
    @total_income_amount = @incomes.sum(:income_amount)
  end
 
  def new
    @income = Income.new
  end

  def create
    @income = Income.new(income_params)
    if @income.save
      redirect_to root_path, notice: '収入を登録しました'
    else
      render :new
    end
  end

  def update
    @income = Income.find(params[:id])
    if @income.update(income_params)
    redirect_to incomes_path, notice: '収入を更新しました'
    else
      render :edit
    end
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
