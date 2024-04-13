class FurimasController < ApplicationController
  def index
    @furimas = Furima.all
  end

  def new
    @furima = Furima.new
  end

  private

  def furima_params
    params.require(:furima).permit(:image).merge(user_id: current_user.id)
  end
end
