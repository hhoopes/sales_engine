Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :merchants do
        get 'find_all'
        get 'find'
        get 'random'
        get ":id/items", to: "merchant_relationships#items"
        get ":id/invoices", to: "merchant_relationships#invoices"
      end


      get 'customers/find_all'
      get 'customers/find'
      get 'customers/random'

      namespace :invoices do
        get 'find_all'
        get 'find'
        get 'random'
        get ":id/transactions", to: "invoice_relationships#transactions"
        get ":id/invoice_items", to: "invoice_relationships#invoice_items"
        get ":id/items", to: "invoice_relationships#items"
        get ":id/customer", to: "invoice_relationships#customer"
        get ":id/merchant", to: "invoice_relationships#merchant"
      end

      namespace :transactions do
        get 'find_all'
        get 'find'
        get 'random'
        get ":id/invoice", to: "transaction_relationships#invoice"
      end

      namespace :invoice_items do
        get 'find_all'
        get 'find'
        get 'random'
        get ":id/invoice", to: "invoice_item_relationships#invoice"
        get ":id/item", to: "invoice_item_relationships#item"
      end

      namespace :items do
        get 'find_all'
        get 'find'
        get 'random'
        get ":id/invoice_items", to: "item_relationships#invoice_items"
        get ":id/merchant", to: "item_relationships#merchant"
      end

      resources :merchants, only: [:index, :show]
      resources :customers, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
    end
  end
end
