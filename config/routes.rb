Rails.application.routes.draw do
  resources :alerts do
    get "/", action: :new, on: :new
  end
  resources :alerters do
    get "/", action: :new, on: :new
  end
  resources :workers do
    get "/", action: :new, on: :new
  end
  resources :datasources do
    get "/", action: :new, on: :new
  end
  resources :checks do
    get "/", action: :new, on: :new
  end
  resources :teams do
    get "/", action: :new, on: :new
  end
  resources :users do
    get "/", action: :new, on: :new
  end
  resources :events do
    get "/", action: :new, on: :new
  end
  post 'user_token' => 'user_token#create'
  root to: 'application#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
