class Wisdoms::SearchesController < ApplicationController
  def index
    @wisdoms = Wisdom.search(params[:keyword])
  end
end
