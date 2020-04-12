Rails.application.routes.draw do
  resources :tutor_subjects, except: [:new, :edit]
  resources :subjects, except: [:new, :edit]
  resources :appointments, except: [:new, :edit]
  resources :users, except: [:show, :new, :edit]

  post "login", to: "authentication#login"
  get "profile", to: "users#profile"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
