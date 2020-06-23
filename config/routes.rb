Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/'
  mount Rswag::Api::Engine => '/'

  namespace :v1 do
    # Timezones
    get '/timezones/city/:city', to: 'timezones#city'
    get '/timezones/country/:country', to: 'timezones#country'
    get '/timezones/gps', to: 'timezones#gps'

    # Holidays
    get 'holidays/all/:country', to: 'holidays#all'
    get 'holidays/remaining/:country', to: 'holidays#remaining'
    post 'holidays/between/:country', to: 'holidays#between'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
