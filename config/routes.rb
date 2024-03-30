Rails.application.routes.draw do
  get 'goods/index'
  root to: "goods#index"
end
