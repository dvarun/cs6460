Rails.application.routes.draw do
  resources :assignments
  resources :tasks
  resources :groups
  resources :courses
  devise_for :users
  resources :group_members

  root "courses#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
