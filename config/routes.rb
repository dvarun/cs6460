Rails.application.routes.draw do
  get "students/index"
  get "students/list_group"
  resources :feedbacks
  resources :discussions
  resources :submissions
  resources :assignments
  resources :tasks
  resources :groups
  resources :courses
  devise_for :users
  resources :group_members

  get "/assignment_discussions/:id", to: "assignment_discussions#show", as: "assignment_discussion"
  mount Commontator::Engine => "/commontator"
  root "courses#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
