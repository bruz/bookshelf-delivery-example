get '/', to: 'home#index', as: :home

resources :activities, only: [:index]
resources :books
