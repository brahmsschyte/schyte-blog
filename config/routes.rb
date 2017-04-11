Rails.application.routes.draw do
  scope 'schyte-admin' do
    resources :posts
    resources :portfolios, as: :profiles, only: [:show, :edit, :update]
    resources :settings, only: [:edit, :update]
    devise_for :users, skip: [:registrations]
    as :user do
      get "users/edit", to: "devise/registrations#edit", as: :edit_user_registration
      put "users", to: "devise/registrations#update", as: :user_registration
    end
    resources :users
    get "/home", to: "pages#home", as: :home
    root 'pages#home', as: :admin_root
  end
  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/blog/:id", to: "pages#blog_post", as: :blog_post
  get "/blog", to: "pages#blog", as: :blog
  get "/portfolio", to: "pages#portfolio", as: :portfolio
  get "/main", to: "pages#main", as: :main

  authenticated :user do
    root 'pages#home', as: :authenticated_root
  end

  root 'pages#main'
end
