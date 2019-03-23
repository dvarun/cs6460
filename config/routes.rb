Rails.application.routes.draw do
  resources :students
  resources :feedbacks
  resources :discussions
  resources :submissions
  resources :assignments
  resources :tasks
  resources :groups
  resources :courses
  devise_for :users
  resources :group_members
  resources :conversations do
    resources :messages
  end

  get "/assignment_discussions/:id", to: "assignment_discussions#show", as: "assignment_discussion"
  get "/students_group/list_group", to: "students#list_groups", as: "list_groups"
  mount Commontator::Engine => "/commontator"
  root "courses#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
