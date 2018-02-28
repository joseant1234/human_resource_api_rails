Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: 'json'} do
  	namespace :v1 do
  		resources :users, only: :create
  		resources :sessions, only: [:create]
  		resources :employees do
  			member do
  				get 'download'
  			end
  		end
      resources :links, only: [:index, :show, :create, :destroy]
      resources :skills, only: [:index,:show]
  	end
  end
end
