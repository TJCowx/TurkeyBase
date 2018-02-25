Rails.application.routes.draw do

    get 'users/new'
    get 'sessions/new'

    # Home page
    root    'welcome#index'
    get     '/home', to: 'welcome#index'
    # Login and Logout
    get     '/login', to: 'sessions#new'
    post    '/login', to: 'sessions#create'
    delete  '/logout', to: 'sessions#destroy'

    # New & Managing Users
    get     '/users',    to: 'users#index'
    get     '/new_user', to: 'users#new'
    post    '/new_user', to: 'users#create'

    # Manage Order seasons
    get     '/new_order_season', to: 'order_seasons#new'
    post    '/new_order_season', to: 'order_seasons#create'

    # New & managing products
    get     '/new_product', to: 'products#new'
    post    '/new_product', to: 'products#create'
    get     '/products', to: 'products#index'

    resources :users
    resources :order_seasons
    resources :order_season_pickup_dates, only: [:new, :create, :destroy]
    resources :products
    resources :product_sizes, only: [:new, :create, :edit, :update]
    resources :product_styles, only: [:new, :create, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
