Rails.application.routes.draw do

  mount Recommender::Engine => "/recommender", as: 'recommender'
end
