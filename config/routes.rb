WeixinApp::Application.routes.draw do
   get 'shops/match' => 'shops#match'
   get 'dianpings/get_deals' => 'dianpings#get_deals'

  resources :users

  resources :shops

  resources :cards

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  resource :weixin
  get 'dianpings/find_businesses' => 'dianpings#find_businesses'
  get 'dianpings/get_user' => 'dianpings#get_user'
  get 'dianpings/get_nearby' => 'dianpings#get_nearby'
  get 'my_card_pack/show' => 'my_card_pack#show'
  get 'my_card_pack/add' => 'my_card_pack#add'
  post 'my_card_pack/added' => 'my_card_pack#added'
  delete 'my_card_pack/destroy' => 'my_card_pack#destroy'
  
  

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
