Rails.application.routes.draw do

  get 'index/index'

  resources :testimonials
  resources :product_categories
  get 'about' => 'pages#about'

  get 'contact' => 'pages#contact'

  #get 'pages/404'

  namespace :qsadmin do

    resources :posts

    resources :dashboards

    get '', to: 'dashboards#index', as: '/'
  end

  get 'login', to: 'sessions#new', as: 'login'


  
  resources :categories

  #get "categories/:name", to: "categories#show"

  #match '/categories/:id/:slug' => 'categories#show', :as => :slug
  resources :sessions

  resources :users

  get '/register' => 'users#new'

  get 'register/confirm/:id' => 'users#show'

  resources :posts do
    resources :comments
  end

  get '/blog' => 'posts#index'

  get 'tags/:tag', to: 'posts#index', as: :tag

  resources :products do
    resources :reviews
  end

  get '/shop' => 'products#index'

  root "index#index"

  mount Ckeditor::Engine => '/ckeditor'

  # error pages
  #get "*any", to: "errors#not_found", :via => all
  #match "/500", :to => "errors#internal_server_error", :via => :all

end
