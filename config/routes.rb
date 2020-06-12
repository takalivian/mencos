Rails.application.routes.draw do
  devise_for :users, controllers: {
  omniauth_callbacks: 'users/omniauth_callbacks',
  registrations: 'users/registrations'
  }
  get    '/auth/:provider/callback', to: 'foo#bar'
  root to:"posts#index"
  resources :posts, only: [:index, :new, :create, :show] do
    member do
      get :category
    end
    
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    member do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    resources :comments, only: :create
  end
  resources :categories, only: [:index]
  resources :users, only: [:show, :edit, :update] do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show, :index]
end
