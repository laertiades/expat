Expat::Application.routes.draw do
  comfy_route :cms_admin, :path => "/#{ENV['CMS_FOLDER']}"
  # get "consultants/new"
  # get "managers/new"
  # get "accounts/new"
  resources :managers
  resources :accounts
  resources :consultants
  resources :contacts, only: [:new, :create]
  match '/contact-us', to: 'contacts#new', via: 'get'
  match '/getting-started', to: 'contacts#new', via: 'get'
  match '/2013 US Tax Questionnaire.xlsx', to: 'contacts#getform', via: 'get'
  match '/captchaurl', to: 'captcha#captchaImage', via: 'get'
  match '/test_message', to: 'contacts#message', via: 'get'

  match "/#{ENV['GOOGLE']}.html", to: proc { |env| [200, {},
    ["google-site-verification: #{ENV['GOOGLE']}.html"]] }, via: 'get'
  match "/#{ENV['SITETRAIL']}.html", to: proc { |env| [200, {},
    ["#{ENV['SITETRAIL']}.html"]] }, via: 'get'
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
  
  # Make sure this routeset is defined last
  comfy_route :cms, :path => '/', :sitemap => true

end
