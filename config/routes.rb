Rails.application.routes.draw do
  devise_for :users
  resources :posts, :comments
  
  root 'posts#index'

  get 'posts/new' => 'posts#new'

  post 'posts/create' => 'posts#create'

  get 'posts/show/:id' => 'posts#show'


  
  
  post 'posts/edit/:id' => 'posts#edit'
  get 'posts/edit/:id' => 'posts#edit'
  
  post 'posts/update/:id' => 'posts#update'
  #get 'posts/update/:id' => 'posts#update'


  delete 'posts/destroy/:id' => 'posts#destroy'

  post 'comments/create' => 'comments#create'

  post 'comments/destroy/:id' => 'comments#destroy'
  #delete 'comments/destroy/:id' => 'comments#destroy'
  
  
  # post 'posts/like_up/:id' => 'posts#like_up'
  # post 'posts/like_dn/:id' => 'posts#like_dn'
  # post 'posts/like_create/:id' => 'posts#like_create'
  
  
  post 'posts/:post_id/like' => 'posts#like_toggle'
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
