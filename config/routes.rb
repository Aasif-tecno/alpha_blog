Rails.application.routes.draw do
  devise_for :users , controllers: {
    session: 'user/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'pages#home'
  get 'about' , to: 'pages#about'
  get 'all_articles' , to: 'pages#articles'
  get 'dashboard', to: 'pages#dashboard'
  get 'users', to: 'pages#index'
  resources :articles
end