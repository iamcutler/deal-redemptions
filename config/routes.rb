DealRedemptions::Engine.routes.draw do
  root to: 'welcome#index'

  # Redemptions
  scope :voucher do
    get ':company', to: 'redeem#new', as: :redemption
    post ':company', to: 'redeem#create'
  end

  # Admin
  namespace :admin do
    get '/', to: 'dashboard#index', as: 'dashboard'
    get 'login', to: 'sessions#new', as: 'login'
    get 'logout', to: 'sessions#destroy', as: 'logout'
    get 'settings', to: 'settings#index', as: 'settings'
    get 'transfer', to: 'import#index', as: 'import'

    resources :user, except: [:new]
    resources :companies
    resources :redemptions
    resources :products, except: [:show]
    resources :sessions
  end
end
