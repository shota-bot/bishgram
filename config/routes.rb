Rails.application.routes.draw do
  mount ActionCable.server => "/cable"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "posts#index"
  resources :posts do
    resources :comments, only: :create
    resources :favorites, only: [:create, :destroy]
  end
  resources :users, only: :show do
    post "follow/:id" => "relationships#follow", as: "follow"
    post "unfollow/:id" => "relationships#unfollow", as: "unfollow"
  end
end
