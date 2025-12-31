Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"


  root to: "static_pages#index"
  get "sobre", to: "static_pages#sobre"
  get "contato", to: "static_pages#contato"

  get "cadastro", to: "users#new"
  get "entrar", to: "sessions#new"
  post "entrar", to: "sessions#create"
  delete "sair", to: "sessions#destroy"

  resources :users, only: [ :show, :new, :create, :edit, :update ] do
    resources :contacts, only: [ :index, :new, :create, :edit, :update, :destroy ]
  end
  resources :sessions, only: [ :new, :create, :destroy ]
end
