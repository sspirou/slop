Rails.application.routes.draw do
  resources :posts
  resources :workouts
  resources :recipes
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'

  # sessions
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  post '/login', to: 'sessions#create'

  # workouts
  post '/add_workout/:user_id/:workout_id', to: 'exercises#add_workout'
  delete '/drop_workout/:user_id/:workout_id', to: 'exercises#drop_workout'

  # recipes
  post '/add_recipe/:user_id/:recipe_id', to: 'meals#add_recipe'
  delete '/drop_recipe/:user_id/:recipe_id', to: 'meals#drop_recipe'

end
