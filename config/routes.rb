Rails.application.routes.draw do
  get 'wisdoms/index'
  root "top#index"
  get '/incomes', to: 'incomes#index'
  get '/tops', to: 'incomes#index'
  get '/expenses', to: 'expenses#index'
  get '/tops', to: 'expenses#index'
  get '/wisdoms', to: 'wisdoms#index'
  get '/tops', to: 'wisdoms#index'

  namespace :incomes do
    resources :searches, only: :index
  end

  namespace :expenses do
    resources :searches, only: :index
  end

  resources :incomes
  resources :expenses
  resources :wisdoms
end
