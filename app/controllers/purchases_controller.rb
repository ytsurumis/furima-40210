class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @furima = Furima.find(params[:furima_id])
  end

  def create
  end
end
