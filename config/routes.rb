Rails.application.routes.draw do
  devise_for :merchants, controllers: {
    sessions: "merchants/sessions",
    registrations: "merchants/registrations"
  }

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
  }

  scope module: "pages" do
    resources :products, only: [:index, :show]
  end

  root "pages/homes#index"
end
