Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => 'users/registrations' }
  root to: 'home#index'

  resource :profile

  resource :comms

  namespace :admin do
    resources :notifications
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
