Rails.application.routes.draw do
  root to: 'projects#index'
  resources :projects do
    resources :orders, only: [:new, :create]
    resources :project_assets, only: [:new, :create]
    resources :teams, only: [:create, :destroy]
  end
  resources :orders, except: [:new, :create] do
    resources :reviews, only: [:new, :create]
  end
  resources :teams, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

end
