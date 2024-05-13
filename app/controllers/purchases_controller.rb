class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_furima, only: [:index, :create, :move_to_index]
  before_action :move_to_index, only: [:index]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @purchase_shipping = PurchaseShipping.new
  end

  def new
    @purchase_shipping = PurchaseShipping.new
  end

  def create
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    if @purchase_shipping.valid?
      pay_item
      @purchase_shipping.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def move_to_index
    return unless @furima.purchase.present? || @furima.user_id == current_user.id
    redirect_to root_path
  end

  def purchase_params
    params.require(:purchase_shipping).permit(:post_code, :area_id, :municipalities, :street, :building, :phone).merge(
      token: params[:token], user_id: current_user.id, furima_id: @furima.id
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @furima.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def set_furima
    @furima = Furima.find(params[:furima_id])
  end
end
