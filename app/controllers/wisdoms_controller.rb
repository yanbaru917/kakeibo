class WisdomsController < ApplicationController
  def index
    @wisdoms = Wisdom.all
  end

  def show

  end

  def new
    @wisdom = Wisdom.new()
  end

  def create
    Wisdom.create(wisdom_params)
    redirect_to root_path
  end

  def update
    wisdom = Wisdom.find(params[:id])
    wisdom.update(wisdom_params)
    redirect_to wisdoms_path
  end

  def edit
    @wisdom = Wisdom.find(params[:id])
  end

  def destroy
    @wisdom = Wisdom.find(params[:id])
    @wisdom.destroy
    redirect_to wisdoms_path
  end

  private
  def wisdom_params
    params.require(:wisdom).permit(:author, :word,)
  end

end
