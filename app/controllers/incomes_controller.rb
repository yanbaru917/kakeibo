class IncomesController < ApplicationController

  def index
    @incomes = Income.includes(:user).order(income_date: :desc).page(params[:page]).per(15)
    @total_income_amount = @incomes.sum(:income_amount)
    @group_incomes = Income.group(:income_name).sum(:income_amount)
    @group_incomes_sort = @group_incomes.sort {|(k1, v1), (k2, v2)| v2 <=> v1 }.to_h
  end
 
  def new
    @income = Income.new
  end

  def create
    @income = Income.new(income_params)
    if @income.save
      redirect_to incomes_path, notice: '収入を登録しました'
    else
      flash[:alert] = '登録できませんでした'
      render action: "new"
    end
  end

  def update
    @income = Income.find(params[:id])
    if @income.update(income_params)
    redirect_to incomes_path, notice: '収入を更新しました'
    else
      flash[:alert] = '更新できませんでした'
      redirect_to action: "edit"
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
    params.require(:income).permit(:income_name, :income_amount, :income_date).merge(user_id: current_user.id)
  end

end
