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

    resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
