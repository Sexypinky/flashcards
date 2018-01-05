Rails.application.routes.draw do
  root 'static_pages#index'
  resource :cards
end
