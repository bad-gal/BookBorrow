Rails.application.routes.draw do

  # Defines the root path route ("/")
  root "home#index"

  devise_scope :user do
    # Redirects signing out users back to sign-in
    get "users", to: "home#index"
  end

  devise_for :users
  resources :books do
    resources :loans
  end
end
