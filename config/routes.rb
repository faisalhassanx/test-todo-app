Rails.application.routes.draw do

resources :todo

get 'help' => 'pages#help'
get '/about' => 'pages#about'

root 'pages#home'

end
