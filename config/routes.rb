Rails.application.routes.draw do
  devise_for :users
  get 'profile', to: 'user#profile'
  root to: 'users#profile'

  resources:clubs
  resources:users
  resources:courts

end
