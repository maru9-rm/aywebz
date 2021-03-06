Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => 'users/registrations' }
  root to: 'home#index'

  resource :profile

  resource :retest


  
  namespace :admin do
    resources :notifications
    resources :tasks do
      resource :achievement
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
