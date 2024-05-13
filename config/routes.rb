Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # resources :users
  root to: 'home#index'
  resources :events do
    post 'join', on: :member
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [] do
    collection do
      get 'events', to: 'users#events'
    end
    member do
      get 'events/:id', to: 'users#show_events', as: 'event'
    end
  end
end
