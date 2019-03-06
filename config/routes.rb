Rails.application.routes.draw do
  get 'groups/new'
  get 'groups/create'
  resources :courses
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
