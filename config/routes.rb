Rails.application.routes.draw do

  get 'authorizations/linkedin'
  get 'authorizations/failure'
  root to: 'projects#index'
  get "profile", to: "pages#profile"
  devise_for :users, controllers: { omniauth_callbacks: 'authorizations' }

  resources :projects do
    resources :orders, only: [:new, :create]
    resources :project_assets, only: [:new, :create]
    collection do
      get 'mine'
    end
    resources :project_members, only: [:create, :destroy]
  end

  resources :orders, except: [:new, :create] do
    resources :reviews, only: [:new, :create]
  end
  resources :teams, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
