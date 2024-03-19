Rails.application.routes.draw do
  get 'my_guides/new'
  get 'my_guides/create'
  get 'my_guides/show'
  get 'my_guides/edit'
  get 'my_guides/update'
  get 'my_guides/redirect'
  get 'articles/show'
  get 'articles/new'
  get 'articles/create'
  get 'articles/edit'
  get 'articles/update'
  get 'subcategories/index'
  get 'subcategories/show'
  get 'searches/search'
  get 'categories/index'
  get 'categories/show'
  get 'users/show'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
