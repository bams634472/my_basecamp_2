Rails.application.routes.draw do
  root "projects#index"

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  resources :users, only: [:new, :create]
  get "/signup", to: "users#new", as: :signup

  get "/login", to: "sessions#new", as: :login
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: :logout

  resources :projects do
    resources :attachments, only: [:create, :destroy]
    resources :project_threads, path: "threads" do
      resources :messages, only: [:create, :edit, :update, :destroy]
    end
  end
end
