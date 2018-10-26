Rails.application.routes.draw do

  resources :rates
  root 'static_pages#about'
  get '/help',  to: 'static_pages#help'
  get '/calculator',  to: 'static_pages#calculator'
  get '/contact',  to: 'static_pages#contact'

end
