Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :v1 do
    get '/timezones/city/:city', to: 'timezones#city'
    get '/timezones/country/:country', to: 'timezones#country'
    get '/timezones/gps', to: 'timezones#gps'
  end

  resources :apidocs, only: [:index]
end
