# frozen_string_literal: true

Rails.application.routes.draw do
  resources :place_temps

  get '/new_format', to: 'place_temps#new_format'
  get '/global', to: 'place_temps#global'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
