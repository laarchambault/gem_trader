Rails.application.routes.draw do
  get '/boxes' => 'boxes#index'
  get '/boxes/:id' => 'boxes#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
