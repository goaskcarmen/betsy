Rails.application.routes.draw do

 ################### HOMEPAGES ####################
  root to: 'homepages#index', as: 'index'

  get 'homepages/index'

  get 'homepages/show_by_category'

  get 'homepages/show_all_products'

  get 'homepages/login'

  get 'homepages/show_by_merchant'
################### HOMEPAGES ####################



################### TRANSACTIONS ####################
  get 'transactions/new' => 'transactions#new', as: 'new_transaction'

  post 'transactions/create' => 'transactions#create', as: 'create_transaction'

  get 'transactions/show'

################### TRANSACTIONS ####################



################### CARTS ####################

  post 'carts/:id/create' => 'carts#create', as: 'create_cart_product'

  get 'carts/edit'

  get 'carts/update'

  get 'carts/show'

  get 'carts/destroy'

################### CARTS ####################



################### REVIEWS ####################

  get 'reviews/new'

  get 'reviews/create'

  get 'reviews/edit'

  get 'reviews/update'
################### REVIEWS ####################



################### SESSIONS ####################

  get 'sessions/create'

  get 'sessions/destroy'

  get "/auth/:provider/callback" =>  "sessions#create"

################### SESSIONS ####################



################### PRODUCTS ####################
  resources :products, except: [:index]
  # get 'products/new', to: "products#new", as: :new_product

  # post 'products', to: 'products#create', as: :products

  # delete 'products/:id', to: "products#destroy", as: :product
  # put/patch 'products/:id', to: "products#update"
  # get 'products/:id', to: "products#show"

  # get 'products/:id/edit', to: "products#edit", as: :edit_product
################### PRODUCTS ####################


################### USERS ####################

  get 'users/logged_in_index'

  get 'users/new'

  get 'users/create'

  get 'users/edit'

  get 'users/update'

  get 'users/destroy'
################### USERS ####################


  get "/auth/:provider/callback" =>  "sessions#create"

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
