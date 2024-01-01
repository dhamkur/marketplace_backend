Rails.application.routes.draw do
  root "pages/homes#index"

  get "service-worker.js", to: "service_worker#service_worker"
  get "manifest.json", to: "service_worker#manifest"

  devise_for :admins, controllers: { sessions: "admins/sessions" }
  devise_for :merchants, controllers: {
    sessions: "merchants/sessions",
    registrations: "merchants/registrations"
  }

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  scope module: "pages" do
    resources :contacts, only: [:index, :create]
    resources :products, only: [:index, :show]
    resources :subscribers, only: :create
  end

  devise_scope :admin do
    namespace :admins do
      resources :banks
      resources :categories
      resources :contacts
      resources :promotions
      resources :subscribers
      resources :taxes
      resources :top_ups, only: [:index, :show, :update]
    end
  end

  devise_scope :user do
    namespace :users do
      resources :carts, except: [:new, :edit]
      resources :checkouts, only: [:create, :show, :update]
      resources :orders, only: [:index, :show, :update]
      resources :payments, only: :create
      resources :settings
      resources :wishlists, only: [:index, :create, :destroy]
      resources :wallets, only: [:index, :show, :create, :update]
    end  
  end
end
