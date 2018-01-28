Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :meet_ups
      resources :organizations
      resources :tech_stacks
      resources :events, only: [:index]
      resources :search_terms
      resources :stories, only: [:index]
      resources :tokens, only: [:create]
      resources :users do
        member do
          patch :toggle_admin
        end
      end
    end
  end
end
