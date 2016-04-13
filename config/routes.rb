Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'merchants/find_all'
      get 'merchants/find'
      get 'merchants/random'

      get 'customers/find_all'
      get 'customers/find'
      get 'customers/random'

      get 'invoices/find_all'
      get 'invoices/find'
      get 'invoices/random'

      get 'transactions/find_all'
      get 'transactions/find'
      get 'transactions/random'

      get 'invoice_items/find_all'
      get 'invoice_items/find'
      get 'invoice_items/random'

      get 'items/find_all'
      get 'items/find'
      get 'items/random'

      resources :merchants, only: [:index, :show]
      resources :customers, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
    end
  end
end
