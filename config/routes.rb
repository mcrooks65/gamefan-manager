Rails.application.routes.draw do
  resources :developers do
    resources :games
  end
  get 'games', to: 'games#index'
  resources :fans
  root 'static_pages#home'
end
