Rails.application.routes.draw do

  resources :images


  resources :products


  mount Recommender::Engine => "/recommender", as: 'recommender'
end
