Rails.application.routes.draw do
  mount GoodJob::Engine => "good_job"

  get "/login", to: "sessions#new", as: :login
  delete "/logout", to: "sessions#destroy", as: :logout

  resources :confirmations, only: [:new]
  resource :dashboard, only: [:show]
  resources :people, only: [:create, :new, :show]
  resources :posts, only: [:show]
  resources :sessions, only: [:new, :create]

  namespace :api do
    namespace :v1 do
      resources :posts, only: [:index]
    end
  end

  root "dashboard#show"
end
