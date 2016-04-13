Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get '/merchants/find_all', to: "merchants#index"
      get '/merchants/find', to: "merchants#show"
      get '/merchants/random', to: "merchants/random#show"

      get '/customers/find_all', to: "customers#index"
      get '/customers/find', to: "customers#show"
      get '/customers/random', to: "customers/random#show"

      get '/transactions/find_all', to: "transactions#index"
      get '/transactions/find', to: "transactions#show"
      get '/transactions/random', to: "transactions/random#show"

      get '/items/find_all', to: "items#index"
      get '/items/find', to: "items#show"
      get '/items/random', to: "items/random#show"

      get '/invoices/find_all', to: "invoices#index"
      get '/invoices/find', to: "invoices#show"
      get '/invoices/random', to: "invoices/random#show"

      get '/invoice_items/find_all', to: "invoice_items#index"
      get '/invoice_items/find', to: "invoice_items#show"
      get '/invoice_items/random', to: "invoice_items/random#show"

      resources :merchants, only: [:index, :show] do
        get "/items", to: "merchants/items#index"
        get "/invoices", to: "merchants/invoices#index"
      end

      resources :customers, only: [:index, :show] do

      end

      resources :items, only: [:index, :show] do
        get "/invoice_items", to: "items/invoice_items#index"
        get "/merchant", to: "items/merchants#show"
      end

      resources :invoices, only: [:index, :show] do
        get "/transactions", to: "invoices/transactions#index"
        get "/invoice_items", to: "invoices/invoice_items#index"
        get "/items", to: "invoices/items#index"
        get "/customer", to: "invoices/customers#show"
        get "/merchant", to: "invoices/merchants#show"
      end

      resources :transactions, only: [:index, :show] do

      end

      resources :invoice_items, only: [:index, :show] do
        get "/invoice", to: "invoice_items/invoices#show"
        get "/item", to: "invoice_items/items#show"
      end

    end
  end
end
