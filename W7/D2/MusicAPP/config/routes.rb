Rails.application.routes.draw do
  resources :users, only: [:create, :show, :new, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :session, only: [:create, :destroy, :new]
end
