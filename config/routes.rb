Rails.application.routes.draw do

  match '*any' => 'application#options', :via => [:options]

  get 'tracking_calls/' => 'tracking_calls#index'
  #
  get 'tracking_calls/main' => 'tracking_calls/main'
  #
  get 'ui_data/main' => 'ui_data#trax'
  #
  get 'param_data/' => 'param_data#index'
  #
  get 'param_data/main' => 'tracking_calls/main'
  #
  post 'param_data/create_service' => 'param_data#create_service'
  #
  post 'param_data/create_service_fields' => 'param_data#create_service_fields'
  #
  post 'param_data/service_fields' => 'param_data#service_fields'
  #
  post 'param_data/edit_service_fields' => 'param_data#submit_service_fields'
  #
  post 'param_data/edit_field_description' => 'param_data#edit_field_description'
  #
  get 'ui_data/services' => 'ui_data#services_form'

  post 'ui_data/services' => 'ui_data#services'
  #
  get 'ui_data/fields' => 'ui_data#fields_form'
  #post 'ui_data/fields' => 'ui_data#fields'
  #
  get 'tracking_calls/new' => 'tracking_calls#new_form'
  post 'tracking_calls/new' => 'tracking_calls#create'
  #
  get 'tracking_calls/search' => 'tracking_calls#search_form'
  post 'tracking_calls/search' =>  'tracking_calls#search'
  #
  get 'tracking_calls/edit_results' =>  'tracking_calls#edit_form'
  post 'tracking_calls/edit_results' =>  'tracking_calls#edit'
  #
  get 'tracking_calls/delete' => 'tracking_calls#delete_form'
  delete 'tracking_calls/delete' =>  'tracking_calls#delete'

  post 'ui_data/search' => 'tracking_calls/search'

  get  'api/tracking_request' => 'tracking_request#search'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resources :param_data do
    get :autocomplete_field_field_name, :on => :collection

    get :autocomplete_service_name, :on => :collection
  end


  #
  resources :ui_data do
    get :hive_select, on: :collection
  end

  # You can have the root of your site routed with "root"
   root 'welcome#index'

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
