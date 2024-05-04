class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @furima = Furima.find(params[:furima_id])
    @purchase_shipping = PurchaseShipping.new
  end

  def new
    @purchase_shipping = PurchaseShipping.new
  end

  def create
    @furima = Furima.find(params[:furima_id])
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    if @purchase_shipping.valid?
      pay_item
      @purchase_shipping.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase_shipping).permit(:user_id, :furima_id, :post_code, :area_id, :municipalities, :street, :building, :phone).merge(token: params[:token], user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @furima.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
