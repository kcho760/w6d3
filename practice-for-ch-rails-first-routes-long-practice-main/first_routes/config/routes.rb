Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # resources :users
    get 'users', to: 'users#index', as: 'user'
    post 'users', to: 'users#create'
    get 'users/new', to: 'users#new', as: 'new_user'
    get 'users/:id/edit', to: 'users#edit', as: 'edit_user'
    get 'users/:id', to: 'users#show'
    patch 'users/:id', to: 'users#update'
    put 'users/:id', to: 'users#update'
    delete 'users/:id', to: 'users#destroy'

    resources :artworks

    resources :artwork_shares, only:[:create, :destroy, :index]
    
    resources :users do
      resources :artworks, only: [:index]
    end

end
