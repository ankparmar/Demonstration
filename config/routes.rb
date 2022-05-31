Rails.application.routes.draw do
  namespace :admin do
    resources :books
    resources :book_requests, only: %i[index update]
  end

  resources :books, only: %i[index show]
  resources :book_requests, only: %i[index create destroy]

  devise_for :users

  root 'books#index'
end
