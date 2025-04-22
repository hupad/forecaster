Rails.application.routes.draw do
  root "weather#new"
  post 'weather/forecast', to: 'weather#forecast', as: :forecast
end
