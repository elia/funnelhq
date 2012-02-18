Baseapp::Application.routes.draw do
  
  get "pages/index"
  
  devise_for :users, :path_names => { :sign_in => 'login', :sign_up => 'new', :sign_out => 'logout', :password => 'password', :confirmation => 'confirmation' }
  
  # When we log in a user through Devise, redirect them to the dashboard
  
  match '/user', :to => 'dashboards#index', :as => :user_root
  
  # Project dashboard
  
  match 'dashboard', :to => 'dashboards#index'
  
  # Resource routes
  
  resources :projects
  resources :issues
  resources :uploads
  resources :clients
  resources :tasks
  
  match 'uploads/:user_id/share/:id', :to => 'uploads#share' 
     
  # Default route
  
  root :to => 'pages#index'

end
