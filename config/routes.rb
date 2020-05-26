Rails.application.routes.draw do
  get 'posts/index'
  devise_for :users, controllers: {
  omniauth_callbacks: 'users/omniauth_callbacks',
  registrations: 'users/registrations'
  }
  root to:"posts#index"
  resources :users
end
