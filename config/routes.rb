Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/timezones/city/:city', to: 'timezones#city'
  get '/timezones/country/:country', to: 'timezones#country'

  resources :apidocs, only: [:index]
end
