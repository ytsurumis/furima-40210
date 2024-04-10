Rails.application.routes.draw do
  debise_for :users
  get 'furimas/index'
  root to: "furimas#index"
end
