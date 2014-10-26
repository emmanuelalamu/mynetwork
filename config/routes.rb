Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  unauthenticated do
    root to: "home#homepage"
  end
  authenticated :user do
    root to: "home#dashboard", as: :authenticated_root
  end

  get 'home/about' , as: :about

  get 'home/userlist' , as: :userlist

  get 'profile/:id' => 'home#profile' , as: :profile

  get 'followers/:id' => 'home#follower' , as: :follower

  get 'home/following' , as: :following

  resources :follows

  resources :statuses

  match 'poststatus' => 'statuses#poststatus', :via => [:post], :as => 'poststatus'
  
  match 'follow' => 'home#follow', :via => [:post], :as => 'followuser'
  
  match 'unfollow' => 'home#unfollow', :via => [:post], :as => 'unfollowuser'
  
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
