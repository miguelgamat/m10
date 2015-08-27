class Users::InvitationsController < Devise::InvitationsController
  
  def update
    if this
      redirect_to bookings_path
    else
      super
    end
  end

  def new
      @user = User.new([params[:user][:email],params[:user][:club_id]])
  end

  def create
		[params[:user][:email]].each do |email|
        	User.invite!({:email => email} current_user)
  end

  protected

  def after_accept_path_for(resource)
    '/devise/sign_up'
  end
  
  def after_invite_path_for(resource_name)
    '/users'
  end

end
