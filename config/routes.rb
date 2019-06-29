Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      scope module: 'merchants', path: 'merchants' do
        get '/find', to: 'finds#show' 
        get '/find_all', to: 'finds#index' 
        get '/random', to: 'randoms#show'
      end
      resources :merchants, only: [:index, :show] 
      scope module: 'customers', path: 'customers' do
        get '/find', to: 'finds#show' 
        get '/find_all', to: 'finds#index' 
        get '/random', to: 'randoms#show'
      end
      resources :customers, only: [:index, :show]
      scope module: 'invoice_items', path: 'invoice_items' do
        get '/find', to: 'finds#show' 
        get '/find_all', to: 'finds#index' 
        get '/random', to: 'randoms#show'
      end
      resources :invoice_items, only: [:index, :show]
      scope module: 'invoices', path: 'invoices' do
        get '/find', to: 'finds#show' 
        get '/find_all', to: 'finds#index' 
        get '/random', to: 'randoms#show'
      end
      resources :invoices, only: [:index, :show]
      scope module: 'items', path: 'items' do
        get '/find', to: 'finds#show' 
        get '/find_all', to: 'finds#index' 
        get '/random', to: 'randoms#show'
      end
      resources :items, only: [:index, :show]
      scope module: 'transactions', path: 'transactions' do
        get '/find', to: 'finds#show' 
        get '/find_all', to: 'finds#index' 
        get '/random', to: 'randoms#show'
      end
      resources :transactions, only: [:index, :show]
    end
  end
end
