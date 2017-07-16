Rails.application.routes.draw do

resources :todos

get 'help' => 'pages#help'
get '/about' => 'pages#about'

root 'pages#home'

end
