Rails.application.routes.draw do
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get   '/', to: 'search#index'
  get '/create', to: "search#create"
  get '/show', to: "search#show"

end
