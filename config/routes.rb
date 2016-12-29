Rails.application.routes.draw do


  resource :session 
  
  resources :todos, only: [:new, :create, :show, :index]

  resources :users

  get 'index' => 'welcome#index'
  get 'about' => 'welcome#about'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

