Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: {
    registrations: 'patients/registrations'
  }

  root to: "users#show"
  resources :appointments, only: %i[create edit update]
  resources :doctors
  resources :patients
end
