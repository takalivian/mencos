Rails.application.routes.draw do
  devise_for :users, controllers: {
  omniauth_callbacks: 'users/omniauth_callbacks',
  registrations: 'users/registrations'
  }
  root to:"posts#index"
  resources :posts, only: [:index, :new, :show]
  resources :users, only: [:show, :edit, :update]
end
