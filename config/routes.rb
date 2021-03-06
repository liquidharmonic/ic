Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/' => 'application#show'
  get '/apply' => 'application#apply'
  get 'background_check' => 'application#background_check'
  get 'done' => 'application#done'
  post '/users' => 'users#create'
end
