Rails.application.routes.draw do
  resources :audit_logs, except: [:new, :edit, :destroy] do
    member do
      patch :confirm
    end
  end
  
  namespace :admin do
    resources :users
    resources :posts
    resources :admin_users

    root to: "users#index"
  end

  resources :posts do
    member do
      patch :approve
    end
  end
  
  devise_for :users, skip: [:registrations]
  root to: 'static#homepage'
end
