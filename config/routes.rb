Rails.application.routes.draw do
  mount GoodJob::Engine => "good_job"

  # Defines the root path route ("/")
  # root "articles#index"
end
