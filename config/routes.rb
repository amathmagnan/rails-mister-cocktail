Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html



   resources :cocktails, only: [:index, :show]
  #resources :doses, only: %i[new create]
end

#resources :doses, only: :destroy
#end
