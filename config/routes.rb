Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "components", to: "pages#components"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Standard RESTful routes for Categories
  resources :categories, only: [:index, :show] do
    # Nested routes for SubCategories within Categories
    resources :sub_categories, only: [:index, :show], shallow: true do
      # Further nested routes for Articles within SubCategories
      resources :articles, only: [:index], shallow: true
    end
  end

  # Routes for Articles (non-nested actions)
  resources :articles, except: [:index] do
    # Nested routes for MyGuides related to specific Articles
    resources :my_guides, shallow: true do
      member do
        get :summary
        get :download
      end
      resources :reminders, shallow: true
    end
  end


  resources :platforms

  resources :users, only: [:show, :edit, :update]
  get "profile", to: "users#profile"
  # If you need a specific route for searching or any other custom action,
  # you can add them here. For example:
  get 'search', to: 'searches#search'
end
