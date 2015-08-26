class Users::InvitationsController < Devise::InvitationsController
  def update
    if this
      redirect_to bookings_path
    else
      super
    end
  end

  def create
  		User.invite!(:email => email)
  end
end
