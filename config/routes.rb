Rails.application.routes.draw do
  resources :developers do
    resources :games
  end
  # get 'games', to: 'games#index'
  resources :fans, :games
  root 'static_pages#home'
  get 'tally', to: 'static_pages#tally'
end
