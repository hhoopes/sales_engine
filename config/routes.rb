Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'merchants/find_all'
      get 'merchants/find'
      get 'customers/find_all'
      get 'customers/find'
      get 'customers/random'
      get 'merchants/random'

      resources :merchants, except: [:new, :edit]
      resources :customers, except: [:new, :edit]
      resources :items, except: [:new, :edit]
      resources :invoices, except: [:new, :edit]
      resources :transactions, except: [:new, :edit]
      resources :invoice_items, except: [:new, :edit]
    end
  end
end
