Rails.application.routes.draw do
  resources :games
  resources :developers
  resources :fans
  root 'static_pages#home'
end
