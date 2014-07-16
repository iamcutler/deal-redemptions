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
    get 'login', to: 'sessions#index', as: 'login'
  end
end
