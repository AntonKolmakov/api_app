Rails.application.routes.draw do
  resources :posts, only: :create

  resources :rates, only: :create do
    collection do
      get :get_rate_posts
    end
  end
end
