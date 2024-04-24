class FurimasController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_furima, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update]

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
  end

  def edit
  end

  def update
    if @furima.update(furima_params)
      redirect_to furima_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @furima.destroy
    redirect_to root_path
  end

  private

  def furima_params
    params.require(:furima).permit(:image, :title, :description, :category_id, :condition_id, :burden_id, :area_id,
                                   :number_of_day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    return if current_user.id == @furima.user_id
    redirect_to action: :index
  end

  def set_furima
    @furima = Furima.find(params[:id])
  end
end
