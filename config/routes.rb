Rails.application.routes.draw do
  resources :students, only: [:index, :show, :create, :destroy]
  resources :instructors, only: [:index, :show, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
