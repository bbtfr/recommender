Recommender::Engine.routes.draw do
  resources :recommends do
    member do
      post 'choice'
    end
    resources :resources
    resources :products
  end
  resources :resources
  resources :products

  root :to => 'recommends#index'
end
