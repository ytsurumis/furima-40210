class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @furima = Furima.find(params[:furima_id])
  end

  def create
    @purchase = Purchase.create(purchase_params)
    Shipping.create(shipping_params)
    redirect_to root_path
  end

  private

  def purchase_params
    params.require(:purchase).permit(:user_id, :furima_id)
  end

  def shipping_params
    params.permit(:post_code, :area_id, :municipalities, :streer, :buinding, :phone).merge(purchase_id: @purchase.id)
  end
end
