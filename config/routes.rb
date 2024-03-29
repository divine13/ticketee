TeketeeApp::Application.routes.draw do
  namespace :admin do
      # Directs /admin/users/* to Admin::UsersController
      # (app/controllers/admin/users_controller.rb)
      root to: "base#index"
      resources :users do 
        resources :permissions
      end
      resources :states do 
        member do 
          get :make_default
        end
      end
    end
    put "admin/users/:user_id/permissions", to: 
     'admin/permissions#update', as: 'update_user_permissions'

  devise_for :users, controller: { registrations: "registrations" } 

  #this will gen a route to confirm_user_path
  get '/awaiting_confirmation',  to: "users#confirmation", as: 'confirm_user'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

   resources :files
   root to: 'projects#index'

   resources :projects do 
   resources :tickets do 
      resources :comments
    end
   end 

    resources :tickets do 
      resources :comments
    resources :tags do
      member do 
          delete :remove
        end
      end
    end

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
   

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

#  Example resource route within a namespace:
 # get "users/index"

end
