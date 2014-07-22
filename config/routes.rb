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

    resources :user
    resources :companies
    resources :products, except: [:show]
    resources :sessions
  end
end
