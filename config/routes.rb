Rails.application.routes.draw do
  resources :offers, except: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  put 'offers/:id/enable', to: 'offers#enable', as: :enable_offer
  put 'offers/:id/disable', to: 'offers#disable', as: :disable_offer
end
