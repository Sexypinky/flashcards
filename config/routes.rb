Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get '/change_locale', to: 'application#change_locale'

  root 'static_pages#index'

  get 'welcome', to: 'static_pages#index'
  post 'welcome', to: 'static_pages#index'
  resources :cards
  resources :decks

  namespace :dashboard do
    post 'cards/cardcheck',to:'cards#cardcheck'
    get 'decks/actualdeck', to: 'decks#actualdeck'
    get 'cards/show', to: 'cards#show'
    resources :cards
    resources :cabinet
    resources :decks
  end

  namespace :home do
  end

  namespace :admin do
    resources :cards
  end

end
