get '/', to: 'home#index', as: :home

resources :activities, only: [:index]
resources :books, only: [:index, :new, :create, :edit, :update, :destroy]
