Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :hello, only: [:index, :create] do
        member do
          get ':name', to: 'hello#show'
        end
      end
      
      get 'hello/:name', to: 'hello#show'
    end
  end
end