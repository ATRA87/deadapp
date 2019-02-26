Rails.application.routes.draw do
  root to: 'project#index'
  resources :projects do
    resources :orders, only: [:new, :create]
    resources :projet_assets, only: [:new, :create]
    resources :teams, only: [:create, :destroy]
  end
  resources :orders, except: [:new, :create] do
    resources :reviews, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

end
