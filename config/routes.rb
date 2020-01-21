Rails.application.routes.draw do
  devise_for :users
  root 'games#index'

  resources :games, only: [:new, :update, :show, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
