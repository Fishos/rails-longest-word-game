Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root to: 'longest_word#game'
  get '/game', to: 'longest_word#game'
  get '/score', to: 'longest_word#score'
end
