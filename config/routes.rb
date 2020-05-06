Rails.application.routes.draw do
  root "top#index"
  namespace :incomes do
    resources :searches, only: :index
  end

  namespace :expenses do
    resources :searches, only: :index
  end

  resources :incomes
  resources :expenses
end
