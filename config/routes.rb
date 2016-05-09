Rails.application.routes.draw do

  get 'about' => 'pages#about'

  get 'contact' => 'pages#contact'

  get 'pages/404'

  namespace :qsadmin do

    resources :posts

    resources :dashboards

    get '', to: 'dashboards#index', as: '/'
  end

  get 'login', to: 'sessions#new', as: 'login'


  
  resources :categories

  get "name", to: "categories#show", as: "aks"

  #match '/categories/:id/:slug' => 'categories#show', :as => :slug
  resources :sessions

  resources :users

  get '/register' => 'users#new'

  get 'register/confirm/:id' => 'users#show'

  resources :posts

  resources :products

  get '/shop' => 'products#index'

  root "products#index"

  mount Ckeditor::Engine => '/ckeditor'

  # error pages
  #get "*any", to: "errors#not_found", :via => all
  match "/500", :to => "errors#internal_server_error", :via => :all

end
