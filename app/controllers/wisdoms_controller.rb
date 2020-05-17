class WisdomsController < ApplicationController
  def index
    @wisdoms = Wisdom.includes(:user).order(created_at: :asc).page(params[:page]).per(10)
    if @wisdoms.present?
      rand = Rails.env.production? ? "RANDOM()" : "rand()"
      @random_wisdoms = Wisdom.order(rand).first
      @random_wisdoms_word = @random_wisdoms.word
      @random_wisdoms_author = @random_wisdoms.author
    end
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
  
  private
  def wisdom_params
    params.require(:wisdom).permit(:author, :word,).merge(user_id: current_user.id)
  end

end
