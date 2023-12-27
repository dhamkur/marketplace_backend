Rails.application.routes.draw do
  root "pages/homes#index"

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
    resources :products, only: [:index, :show]
  end

  devise_scope :user do
    namespace :users do
      resources :carts, except: [:new, :edit]
      resources :checkouts, only: [:create, :show, :update]
      resources :orders, only: [:index, :show, :update]
      resources :payments, only: :create
      resources :wishlists, only: [:index, :create, :destroy]
      resources :wallets, only: [:index, :show, :create, :update]
    end  
  end
end
