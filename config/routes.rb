Template::Application.routes.draw do

  resources :documents


  scope 'administration' do
    resources :contents
  end
  
  match "/administration" => "pages#admin", :as => "admin" #"user_root"
  match "/home" => "pages#index", :as => "website"
  match '/mail' => 'pages#send_mail', :as => :email, :via => :post
  match "/upload" => "pages#upload"
  match "/search" => "pages#search"
  match "/article/:id" => "pages#article"
  match "/add-image" => "pages#add_image"
  
  get "pages/index"
  get "pages/administration"

  devise_for :users, :path => 'administration/account', :controllers => {:registrations => "registrations", :sessions => "sessions", :passwords => "passwords"}
  devise_scope :user do
    get "login", :to => "devise/sessions#new"
    get "logout", :to => "devise/sessions#destroy"
    get "register", :to => "registrations#new"
    get "/administration/account/settings" => "registrations#edit"
  end
  
  authenticated :user, lambda {|u| u.admin == true} do
    root :to => "pages#admin", :as => :admin_root
    match "/home" => "pages#index", :as => "website"
  end
  
  root :to => "pages#index"

end
