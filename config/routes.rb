Rails.application.routes.draw do
  resources :brevis

  root :controller => 'brevis', :action => :new
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
