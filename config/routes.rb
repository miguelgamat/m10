Rails.application.routes.draw do

  get 'home/index'
	get '/', to: "home#index"

  # Redirect from email invitation
  # get 'users/invitation/accept/'
  # get '/'

  get 'profile', to: 'user#profile'
  root to: 'users#profile'

  resources:clubs
  resources:users
  resources:courts
  resources:bookings
  resources:memberships

  devise_for :users, controllers: { registrations: "registrations", invitations: 'devise/invitations'}
  
  get 'get_hours' => 'bookings#show_time'

end
