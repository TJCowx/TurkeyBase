Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

    # Home page
    root    'welcome#index'
    get     '/home', to: 'welcome#index'
    # Login and Logout
    get     '/login', to: 'sessions#new'
    post    '/login', to: 'sessions#create'
    delete  '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
