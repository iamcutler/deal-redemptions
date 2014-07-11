DealRedemptions::Engine.routes.draw do
  root to: 'welcome#index'

  # Redemptions
  get '/voucher/:company', to: 'redeem#index', as: :redeem
end
