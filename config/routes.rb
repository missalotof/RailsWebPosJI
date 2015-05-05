Rails.application.routes.draw do
  get 'home/index'
  get '/home/index' => 'home#index'
  get '/home/product_list' => 'home#product_list',:as=>"product_list"
  get '/home/shopping_cart' => 'home#shopping_cart',:as=>"shopping_cart"
  get '/home/pay_list' => 'home#pay_list',:as=>"pay_list"
  get '/home/clickBtnToAdd' => 'home#clickBtnToAdd'
  get 'home/addBtn' => 'home#addBtn'
  get 'home/minusBtn' => 'home#minusBtn'
  get 'home/truePayBtn' => 'home#truePayBtn'
  get 'home/addShoppingItem' => 'home#get_shop_lists_num'
  get 'home/get_goods_min'=> 'home#minusBtn'
  get 'home/get_goods_add'=>'home#addBtn'
  # get 'home/click_to_pay'=>'home#showFreeList'
  # get 'home/truePayBtn'=>'home#truePayBtn'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

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
