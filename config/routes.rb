Rails.application.routes.draw do

  namespace :qsadmin do
    resources :posts
    resources :dashboards
    get '', to: 'dashboards#index', as: '/'
  end

  get 'login', to: 'sessions#new', as: 'login'
  
  resources :categories
  resources :sessions
  resources :users
  resources :posts
  root "posts#index"
  mount Ckeditor::Engine => '/ckeditor'

end
