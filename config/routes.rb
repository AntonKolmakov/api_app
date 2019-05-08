Rails.application.routes.draw do
  resources :posts, only: :create

  resources :rates, only: :create

end
