class WisdomsController < ApplicationController
  def index
    @wisdoms = Wisdom.all
  end

  def new
    @wisdom = Wisdom.new()
  end

  def create
    @wisdom= Wisdom.new(wisdom_params)
    if @wisdom.save
    redirect_to root_path, notice: '登録しました'
    else
      render :new
    end
  end

  def update
    @wisdom = Wisdom.find(params[:id])
    if @wisdom.update(wisdom_params)
      redirect_to wisdoms_path, notice: '更新しました'
    else
      render :edit
    end
  end

  def edit
    @wisdom = Wisdom.find(params[:id])
  end

  def destroy
    @wisdom = Wisdom.find(params[:id])
    @wisdom.destroy
    redirect_to wisdoms_path
  end

  def search
    @wisdom = Wisdom.search(params[:keyword])
  end

  private
  def wisdom_params
    params.require(:wisdom).permit(:author, :word,)
  end

end
