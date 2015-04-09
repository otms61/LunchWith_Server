Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  namespace :api do
    namespace :v1 do
      resources 'user', only: [:index, :create, :update]
      resources 'home', only: [:index]
      resources 'university', only: [:index]
      resources 'coupon', only: [:show, :create, :destroy]
      resources 'matching', only: [:create]
      resources 'message', only: [:index, :create]
    end
  end
end
