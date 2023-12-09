Rails.application.routes.draw do
  devise_for :merchants
  devise_for :users

  scope module: "pages" do
    resources :homes, only: :index
  end

  root "pages/homes#index"
end
