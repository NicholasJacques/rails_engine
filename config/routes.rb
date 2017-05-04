Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do

      namespace :merchants do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random', to: 'random#show'
        get '/most_revenue', to: 'most_revenue#index'
      end

      resources :merchants, only: [:index, :show] do
        scope module: :merchants do
          resources :items, only: [:index]
          resources :invoices, only: [:index]
        end
      end

      namespace :invoice_items do
        get '/find', to: 'find#show'
        get 'find_all', to: 'find#index'
        get '/random', to: 'random#show'
      end

      resources :invoice_items, only: [:index, :show] do
        scope module: :invoice_items do
          resource :invoice, only: [:show]
          resource :item, only: [:show]
        end
      end

      namespace :customers do
        get '/find', to: 'find#show'
        get 'find_all', to: 'find#index'
        get '/random', to: 'random#show'
      end
 
      resources :customers, only: [:index, :show] do
        scope module: :customers do 
          resources :invoices, only: [:index]
          resources :transactions, only: [:index]
        end
      end

      namespace :items do
        get '/find', to: 'find#show'
        get 'find_all', to: 'find#index'
        get '/random', to: 'random#show'
      end

      resources :items, only: [:index, :show] do
        scope module: :items do
          resources :invoice_items, only: [:index]
          resource :merchant, only: [:show]
        end
      end

      namespace :invoices do
        get '/find', to: 'find#show'
        get 'find_all', to: 'find#index'
        get '/random', to: 'random#show'
      end

      resources :invoices, only: [:index, :show] do
        scope module: :invoices do
          resources :transactions, only: [:index]
          resources :invoice_items, only: [:index]
          resources :items, only: [:index]
          resource :customer, only: [:show]
          resource :merchant, only: [:show]
        end
      end

      namespace :transactions do
        get '/find', to: 'find#show'
        get 'find_all', to: 'find#index'
        get '/random', to: 'random#show'
      end

      resources :transactions, only: [:index, :show] do
        scope module: :transactions do
          resource :invoice, only: [:show]
        end
      end
    end
  end
end
