Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      scope module: 'merchants', path: 'merchants' do
        get '/find', to: 'finds#show' 
        get '/find_all', to: 'finds#index' 
        get '/random', to: 'randoms#show'
        get '/:id/invoices', to: 'invoices#index'
        get '/:id/items', to: 'items#index'
        get '/most_revenue', to: 'most_revenues#index'
        get '/most_items', to: 'most_items#index'
        get '/revenue', to: 'revenues#index'
      end
      resources :merchants, only: [:index, :show] 

      scope module: 'customers', path: 'customers' do
        get '/find', to: 'finds#show' 
        get '/find_all', to: 'finds#index' 
        get '/random', to: 'randoms#show'
        get '/:id/invoices', to: 'invoices#index'
        get '/:id/transactions', to: 'transactions#index'
        get '/:id/favorite_merchant', to: 'favorite_merchants#show'
      end
      resources :customers, only: [:index, :show]

      scope module: 'invoice_items', path: 'invoice_items' do
        get '/find', to: 'finds#show' 
        get '/find_all', to: 'finds#index' 
        get '/random', to: 'randoms#show'
        get '/:id/invoice', to: 'invoices#show'
        get '/:id/item', to: 'items#show'
      end
      resources :invoice_items, only: [:index, :show]

      scope module: 'invoices', path: 'invoices' do
        get '/find', to: 'finds#show' 
        get '/find_all', to: 'finds#index' 
        get '/random', to: 'randoms#show'
        get '/:id/invoice_items', to: 'invoice_items#index'
        get '/:id/merchant', to: 'merchants#show'
        get '/:id/transactions', to: 'transactions#index'
        get '/:id/items', to: 'items#index'
        get '/:id/customer', to: 'customers#show'

      end
      resources :invoices, only: [:index, :show]

      scope module: 'items', path: 'items' do
        get '/find', to: 'finds#show' 
        get '/find_all', to: 'finds#index' 
        get '/random', to: 'randoms#show'
        get '/:id/invoice_items', to: 'invoice_items#index'
        get '/:id/merchant', to: 'merchants#show'
      end
      resources :items, only: [:index, :show]

      scope module: 'transactions', path: 'transactions' do
        get '/find', to: 'finds#show' 
        get '/find_all', to: 'finds#index' 
        get '/random', to: 'randoms#show'
        get '/:id/invoice', to: 'invoices#show'
      end
      resources :transactions, only: [:index, :show]
    end
  end
end
