Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :replys
    end  
  end
  
  resources :posts, only: [:create, :destroy,:show,:new] do
    member do
      get :replyeds
    end
  end  
  
  resources :comments,only:[:create,:destroy]
  
   get 'rankings/post', to: 'rankings#post'
end
