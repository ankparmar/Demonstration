Rails.application.routes.draw do
  resources :books
  resources :book_requests do
    member do
      patch :update_status
    end
  end
  get 'my_book_request', to: 'book_requests#show'
   devise_for :users

  # devise_for :users, controllers: {
  #   registrations: 'users/registrations',
  #   sessions: 'users/sessions'
  # }

 

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'books#index'
end
