Rails.application.routes.draw do
  root 'home#new' #signin page

  get '/home/show', to: 'home#show'
  get '/home/new', to: 'home#new'

  get '/dummy', to: 'home#dummy'

  get '/users/new', to: 'users#new' #signup page
  post '/users/create', to: 'users#create'
  post '/users/destroy', to: 'user#destroy'

  post '/sessions/create', to: 'sessions#create'
  post '/sessions/destroy', to: 'sessions#destroy'

  post '/matches/create', to: 'matches#new'
  get '/matches/find', to: 'matches#find'
  post '/matches/join', to: 'matches#join'
  get '/matches/load', to: 'matches#load_match'
  get '/matches/refresh_board', to: 'matches#refresh_board'
  post '/matches/forfeit', to: 'matches#forfeit'
  get '/matches/end', to: 'matches#end'
end
