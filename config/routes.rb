Rails.application.routes.draw do

  # resources :subscriptions

  devise_for :users, :controllers => { sessions: "sessions", registrations: "registrations", passwords: "passwords" }
  
  get '/dashboard' => 'dashboard#home', as: :dashboard
  resource :dashboard, only: [] do
    resources :settings, only: [:show]
    resources :properties do
      patch '/:id' => 'properties#update'
    end
  end

  get 'pages/home'
  get 'users/sign_up' => 'registrations#new', as: :users
  get 'terms-of-service' => 'pages#terms_of_service', as: :terms_of_service
  get 'privacy-policy' => 'pages#privacy_policy', as: :privacy_policy
  delete 'images/destroy' => 'images#destroy'
  post '/images/create' => 'images#create'
  root 'pages#home'

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
