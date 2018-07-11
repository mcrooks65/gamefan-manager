Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  resources :developers do
    resources :games
  end
  resources :fans, :games
  root 'static_pages#home'
  get 'tally', to: 'static_pages#tally'
end
