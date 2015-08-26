class Users::InvitationsController < Devise::InvitationsController
  def update
    if this
      redirect_to root_path
    else
      super
    end
  end

  def create
  	User.invite!
  end
end
