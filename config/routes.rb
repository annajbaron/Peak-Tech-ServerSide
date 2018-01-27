Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :organizations
      resources :tokens, only: [:create]
      resources :users do
        member do
          patch :toggle_admin
        end
      end
    end
  end
end
