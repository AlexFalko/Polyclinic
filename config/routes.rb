Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'patients/registrations'
  }

  root to: "users#index"
end
