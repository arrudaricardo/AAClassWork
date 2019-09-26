Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show, :update, :destroy, :create] do
    resources :artworks, only: [:index]
    resources :comments, only: [:index] 
    resources :likes, only: [:index] 
    
  end

  resources :artworks, only: [:show, :update, :destroy, :create] do   
    resources :comments, only: [:index] 
    resources :likes, only: [:index] 
    member do 
      get 'favorite_artwork'
    end
  end
  
  resources :artwork_shares, only: [:destroy, :create] do
    member do 
      get 'favorite_artwork_share'
    end
  end

  resources :comments, only: [:destroy, :create]

  resources :likes, only: [:destroy, :create]

end
