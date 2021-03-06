class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
before_action :configure_permitted_parameters, if: :devise_controller?

protected
   		def configure_permitted_parameters
    		devise_parameter_sanitizer.for(:sign_up) << :name << :address << :zip_code << :mobile_number << :admin <<:last_name
    		  # Only add some parameters
			  devise_parameter_sanitizer.for(:accept_invitation) do |u|
			  	u.permit(:first_name, :last_name, :phone, :password, :password_confirmation,
	             :invitation_token)
        devise_parameter_sanitizer.for(:invite).concat [:club_id]
			  end
   		end
end
