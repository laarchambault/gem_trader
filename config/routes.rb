Rails.application.routes.draw do
  get '/boxes' => 'boxes#index'
  get '/boxes/:id' => 'boxes#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show]
  get '/', to: 'welcome#home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/sell_cards', to: 'users#select_cards'
  post '/sell_cards', to: 'users#sell_cards'
end
