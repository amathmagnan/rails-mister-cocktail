# frozen_string_literal: true

# :nodoc:
Rails.application.routes.draw do
  root to: 'cocktails#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cocktails, except: :index, only: %i[index show new create edit update destroy] do
    collection do
      post :search
    end
    resources :doses, only: %i[new create]
    resources :reviews, only: %i[new create]
  end
  resources :reviews, only: :destroy
  resources :doses, only: :destroy
end
