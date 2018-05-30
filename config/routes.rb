Rails.application.routes.draw do
  resources :brevis

  root :controller => 'brevis', :action => :index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/:slug', to: 'brevis#show'
  get '/board', to: 'brevis#index'
end
