Rails.application.routes.draw do

  resources :group_categories
  resources :group_catgories
  get 'password_resets/new'

  get 'index/index'

  resources :testimonials
  resources :product_categories
  get 'about' => 'pages#about'

  get 'contact' => 'pages#contact'

  get '/home-demo-2' => 'index#home2'
  get '/home-demo-3' => 'index#home3'

  #get 'pages/404'

  get 'login', to: 'sessions#new', as: 'login'

  resources :categories

  resources :sessions

  get '/login' => 'sessions#new'

  resources :users

  resources :password_resets

  get '/register' => 'users#new'

  get 'register/confirm/:id' => 'users#show'

  resources :posts do
    resources :comments
  end

  get '/blog' => 'posts#index'

  get 'tags/:tag', to: 'posts#tag', as: :tag

  resources :products do
    resources :reviews
  end

  get '/shop' => 'products#index'

  root "index#index"

  mount Ckeditor::Engine => '/ckeditor'

  # error pages
  #get "*any", to: "errors#not_found", :via => all
  #match "/500", :to => "errors#internal_server_error", :via => :all

  namespace :qsadmin do

    resources :posts

    resources :dashboards

    get '', to: 'dashboards#index', as: '/'
  end

end
