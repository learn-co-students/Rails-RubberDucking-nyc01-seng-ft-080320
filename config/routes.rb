Rails.application.routes.draw do
  # resources :studentducks
  resources :ducks, only: [:index, :show, :edit, :update, :new, :create, :destroy]
  resources :students, only: [:index, :show, :new, :create, :edit, :update, :destroy ]
end
