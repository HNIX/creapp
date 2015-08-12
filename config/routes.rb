Rails.application.routes.draw do
  #devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {registrations: "users/registrations", sessions: "users/sessions", passwords: "users/passwords"}, skip: [:sessions, :registrations]


  #->Prelang (user_login:devise/stylized_paths)
  devise_scope :user do
    get    "login"   => "users/sessions#new",         as: :new_user_session
    post   "login"   => "users/sessions#create",      as: :user_session
    delete "signout" => "users/sessions#destroy",     as: :destroy_user_session

    get    "signup"  => "users/registrations#new",    as: :new_user_registration
    post   "signup"  => "users/registrations#create", as: :user_registration
    put    "signup"  => "users/registrations#update", as: :update_user_registration
    get    "account" => "users/registrations#edit",   as: :edit_user_registration
  end

  root to: 'landings#main'

  resources :investors, only: [:index, :show]

  resources :assets, only: [:index, :new, :create, :edit] do
    get :new_application, on: :new
    post :create_application, on: :new

    post :create_message, on: :member
    post :cancel, on: :member
    post :offer, on: :member
    post :decline, on: :member
    post :start, on: :member
    post :finish, on: :member
  end

  resources :asset_listings, only: [:index, :show, :new, :edit, :create, :update]

  resources :users, only: [:edit, :update] do
    resource :investor, only: [:edit, :update] do
      #post :verify_contribution, defaults: { format: :json }
    end
    resource :client, only: [:new, :create, :edit, :update]
    # resource :payment_info, only: [:edit] do
    #   # The Balanced Payments API scrubs the _method parameter, so :update must be a POST
    #   post :update, defaults: { format: :json }
    # end
  end

  #resources :blog, only: [:index, :show]

  get '/terms', to: 'legal#terms'
  get '/sitemap.xml.gz', to: 'sitemaps#show'
  get '/login', to: 'login#main'

  get 'landings/index'

  resources :companies
  resources :locations
  resources :tenants



end
