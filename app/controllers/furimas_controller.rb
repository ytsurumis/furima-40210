class FurimasController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :move_to_index, except: [:index, :show]

  def index
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

  def show
    @furima = Furima.find(params[:id])
  end

  def edit
    @furima = Furima.find(params[:id])
  end

  def update
    @furima = Furima.find(params[:id])
    if @furima.update(furima_params)
      redirect_to furima_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def furima_params
    params.require(:furima).permit(:image, :title, :description, :category_id, :condition_id, :burden_id, :area_id,
                                   :number_of_day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    @furima = Furima.find(params[:id])
    return if user_signed_in? && current_user.id == @furima.user_id

    redirect_to action: :index
  end
end
