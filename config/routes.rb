DealRedemptions::Engine.routes.draw do
  root to: 'welcome#index'

  # Redemptions
  scope :voucher do
    get ':company', to: 'redeem#new', as: :redemption
    post ':company', to: 'redeem#create'
  end

  get 'thankyou', to: 'redeem#thankyou', as: :thank_you

  get 'validate/code/:company/:code', to: 'redeem#validate_code', as: :validate_redeem_code

  # Admin
  namespace :admin do
    get '/', to: 'dashboard#index', as: 'dashboard'
    get 'login', to: 'sessions#new', as: 'login'
    get 'logout', to: 'sessions#destroy', as: 'logout'
    get 'settings', to: 'settings#index', as: 'settings'

    scope :transfer do
      get '', to: 'import#new', as: 'import'
      post '', to: 'import#create'
      get 'export_redemptions', to: 'import#export_redemptions', as: :export_redemptions
    end

    resources :user, except: [:new]
    resources :companies
    resources :redemptions
    resources :products, except: [:show]
    resources :sessions
  end
end
