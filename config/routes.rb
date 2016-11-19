Rails.application.routes.draw do
  resources :alerts
  resources :alerters
  resources :workers
  resources :datasources
  resources :checks
  resources :teams
  resources :users
  resources :events
  post 'user_token' => 'user_token#create'
  root to: 'application#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
