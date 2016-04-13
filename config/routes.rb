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

      resources :merchants, except: [:new, :edit]
      resources :customers, except: [:new, :edit]
      resources :items, except: [:new, :edit]
      resources :invoices, except: [:new, :edit]
      resources :transactions, except: [:new, :edit]
      resources :invoice_items, except: [:new, :edit]
    end
  end
end
