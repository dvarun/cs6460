Rails.application.routes.draw do
  resources :submissions
  resources :assignments
  resources :tasks
  resources :groups
  resources :courses
  devise_for :users
  resources :group_members

  get "/assignment_discussions/:id", to: "assignment_discussions#show"
  mount Commontator::Engine => "/commontator"
  root "courses#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
