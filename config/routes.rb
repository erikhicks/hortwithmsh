HortwithmshV2::Application.routes.draw do
  resources :subjects

  resources :materials

  resources :classrooms do
    post 'edit'
    post 'add_unit'
    post 'delete'
  end

  resources :materials do
    post 'delete'
  end

  resources :units do
    post 'delete'
  end

  post 'classrooms/sort' => 'classrooms#sort'

  match 'classes/:name' => 'main#classroom'
  match 'classes/:class_name/files/:file_name' => 'main#download'

  match 'plant_science' => 'main#plant_science'
  match 'plant_science_ii' => 'main#plant_science_ii'
  match 'floral_design' => 'main#floral_design'
  match 'career_choices' => 'main#career_choices'

  match 'about' => 'main#about'
  match 'greenhouse' => 'main#greenhouse'
  match 'ffa' => 'main#ffa'
  match 'stem' => 'main#stem'
  match 'plant-sale' => 'main#plant_sale'
  match 'hydroponics' => 'main#hydroponics'

  match 'mobile' => 'mobile#index'

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
  root :to => 'main#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
