Rails.application.routes.draw do
  namespace :admin do
    resources :books
    resources :book_requests, only: %i[index update]
  end

  resources :books, only: %i[index show]
  resources :book_requests, only: %i[index create destroy]

  devise_for :users

  root 'home#index'
  # root 'sessions#new'
  # post '/admin/books', to: 'books#create'
  match '/books', to: 'admin/books#create', via: [:post]
  match '/books/:id', to: 'admin/books#update', via: [:put, :patch]


end
