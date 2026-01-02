Rails.application.routes.draw do
  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Páginas estáticas
  root "static_pages#index"
  get "home", to: "static_pages#index"
  get "sobre", to: "static_pages#sobre"
  get "contato", to: "static_pages#contato"

  # Autenticação simples
  get "cadastro", to: "users#new"
  get "entrar", to: "sessions#new"
  post "entrar", to: "sessions#create"
  delete "sair", to: "sessions#destroy"

  # Recursos principais
  resources :users, only: [ :show, :new, :create, :edit, :update ]
  resources :contacts
  resources :sessions, only: [ :new, :create, :destroy ]
end
