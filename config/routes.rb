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
    #get     '/order_season', to: 'order_seasons#index'
    get     '/new_order_season', to: 'order_seasons#new'
    post    '/new_order_season', to: 'order_seasons#create'

    # Delete Order Season pickup dates
    resources :users
    resources :order_seasons
    resources :order_season_pickup_dates

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
