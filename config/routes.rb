Rails.application.routes.draw do
  devise_for :admins, path: 'admin', skip: [:registrations, :passwords]

  get 'home/index'

  root 'home#index'

  resources :projects
  resources :members
end
