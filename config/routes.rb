Rails.application.routes.draw do
  resources :songs
  delete '/songs/:id', to: 'people#destroy', as:'person'
end
