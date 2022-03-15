# frozen_string_literal: true

Rails.application.routes.draw do
  get 'dashboards/show'
  resource :dashboard, only: %i[show]

  resources :stars
  resources :planets
  resources :moons

  root 'dashboards#show'
end
