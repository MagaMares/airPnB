Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :planets do
    resources :bookings, only: [:index, :new, :create]
  end
  resources :bookings, only: [:show, :edit, :update, :destroy]
end
