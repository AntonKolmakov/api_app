Rails.application.routes.draw do
  resources :posts, only: :create

  resources :rates, only: :create do
    collection do
      get :get_rate_posts
      get :get_ips
    end
  end
end
