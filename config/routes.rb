Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  resources :allocations, only:[:index] do
    collection do
      get 'stocks'
      get 'bonds'
      get 'cash'
    end
  end

  get 'home/index'

  root 'allocations#index'
end