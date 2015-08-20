Rails.application.routes.draw do

  get 'home/index'
	get '/', to: "home#index"

  devise_for :users
  get 'profile', to: 'user#profile'
  root to: 'users#profile'

  resources:clubs
  resources:users
  resources:courts
  resources:bookings
  resources:memberships

end
