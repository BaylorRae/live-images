Rails.application.routes.draw do
  root to: "images#latest"

  resources :projects, only: [:index, :new, :create] do
    resources :images
  end
end
