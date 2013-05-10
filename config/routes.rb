Whim::Application.routes.draw do
  #resources "pages" , :constraints => { :id => /[^\/]+/ }
  #resources "pages"#, :constraints => { :id => /.+/ }
  get "edit" => "pages#edit", :defaults => {:id => ""}
  get "pages" => "pages#index"
  get "pages/new" => "pages#new"
  post "pages" => "pages#create"
  get "pages/:id" => "pages#show", :constraints => { :id => /[^.]+/ }
  get "pages/*id(.:format)/edit" => "pages#edit", :constraints => { :id => /[^.]+/ }
  put "pages/:id" => "pages#update",:constraints => { :id => /[^.]+/ }
  delete "pages/:id" => "pages#destroy",:constraints => { :id => /[^.]+/ }
  post "api/markdown2html" => "api#markdown2html"
  
#  GET             /photos                 index        photos_path 
#  GET             /photos/new             new          new_photo_path
#  POST            /photos                 create       photos_path
#  GET             /photos/:id             show         photo_path(:id)
#  GET             /photos/:id/edit        edit         edit_photo_path(:id)
#  PUT             /photos/:id             update       photo_path(:id)
#  DELETE          /photos/:id             destroy      photo_path(:id)

  #match ':image_path', :controller => :attached_files , :action => :index

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'pages#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
