Rails.application.routes.draw do

  get "about", to: "about#index"

  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "session#new"
  post "sign_in", to: "session#create"

  delete "logout", to: "session#destroy"

  get "password/reset", to: "passwords#new" 
  post "password/reset", to: "passwords#create"

  get "password/reset/edit", to: "passwords_reset#edit" 
  patch "password/reset/edit", to: "passwords_reset#update"

  root to: "main#index"
end
