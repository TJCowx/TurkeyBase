Rails.application.routes.draw do

    get 'users/new'
    get 'sessions/new'

    # Home page
    root    'welcome#index'
    get     '/home', to: 'welcome#index'
    get     '/help', to: 'welcome#help'
    # Login and Logout
    get     '/login', to: 'sessions#new'
    post    '/login', to: 'sessions#create'
    delete  '/logout', to: 'sessions#destroy'

    # New & Managing Users
    get     '/users',    to: 'users#index'
    post    '/users/:id', to: 'users#toggle'
    get     '/new_user', to: 'users#new'
    post    '/new_user', to: 'users#create'

    # Manage Order seasons
    get     '/new_order_season', to: 'order_seasons#new'
    post    '/new_order_season', to: 'order_seasons#create'

    # New & managing products
    get     '/new_product', to: 'products#new'
    post    '/new_product', to: 'products#create'
    get     '/products', to: 'products#index'
    post    '/product_sizes/:id', to: 'product_sizes#toggle'
    post    '/product_styles/:id', to: 'product_styles#toggle'

    # New & managing Orders
    get     '/new_order', to: 'orders#new'
    post    '/new_order', to: 'orders#create'
    get     '/order_seasons/:id/orders', to: "order_seasons#list_orders", as: :list_orders
    post    '/orders/:id', to: "orders#toggle_picked_up"

    # TODO: Set the onlys for the resources
    resources :users, except: [:new, :create, :toggle, :index]
    resources :order_seasons, except: [:new, :create]
    resources :pickup_dates, only: [:new, :create, :destroy]
    resources :products, except: [:new]
    resources :product_sizes
    resources :product_styles
    resources :order_season_products
    resources :orders, except: [:new, :toggle_picked_up]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
