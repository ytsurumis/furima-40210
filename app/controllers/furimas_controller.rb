class FurimasController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @furimas = Furima.all
    @furimas = Furima.order(created_at: :desc)
  end

  def new
    @furima = Furima.new
  end

  def create
    @furima = Furima.new(furima_params)
    if @furima.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def furima_params
    params.require(:furima).permit(:image, :title, :description, :category_id, :condition_id, :burden_id, :area_id,
                                   :number_of_day_id, :price).merge(user_id: current_user.id)
  end
end
