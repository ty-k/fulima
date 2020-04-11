Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root to: 'items#index'


  resources :products do
    collection do
      get :new
    end
  end

  resources :items do
    member do
      get :sample
      get :sample2
      post :purchace
    end
    collection do
      get :finish
      get :newindex
    end
    
    
  end

  resources :users

  resources :credit, only: [:new, :index, :show] do
    collection do
      post :pay
      post :delete
    end
  end

  resources :mypage do
    collection do
      get :sell
      get :purchace
      get :profile
      get :logout
      get :mail
    end
  end

end

