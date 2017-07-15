Rails.application.routes.draw do

get 'help' => 'pages#help'
get '/about' => 'pages#about'

root 'pages#home'

end
