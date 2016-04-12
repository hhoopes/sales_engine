Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
<<<<<<< HEAD
      get 'merchants/find_all'
=======
>>>>>>> 6aaee9d23b2ed6255f7327481cba45287ef83599
      get 'merchants/find'
      resources :merchants, except: [:new, :edit]
      resources :customers, except: [:new, :edit]
      resources :items, except: [:new, :edit]
      resources :invoices, except: [:new, :edit]
      resources :transactions, except: [:new, :edit]
      resources :invoice_items, except: [:new, :edit]
    end
  end
end
