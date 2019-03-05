Rails.application.routes.draw do

  get 'reviews/new'
  get 'reviews/create'
  get 'authorizations/linkedin'
  get 'authorizations/failure'
  root to: 'pages#home'
  get "profile", to: "pages#profile", as: :profile
  devise_for :users, controllers: { omniauth_callbacks: 'authorizations' }

  resources :orders do
    resources :payments, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end
  resources :projects do
    resources :users, only: [] do
      resources :chats, only: [:create, :index,]
    end
    resources :project_assets, only: [:new, :create]
    collection do
      get 'mine'
    end
    resources :project_members, only: [:create, :destroy]
  end

  resources :project_members, only: [:index, :show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
