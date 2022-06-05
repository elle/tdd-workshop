Rails.application.routes.draw do
  mount GoodJob::Engine => "good_job"

  resources :confirmations, only: [:new]
  resource :dashboard, only: [:show]
  resources :posts, only: [:show]

  root "dashboard#show"
end
