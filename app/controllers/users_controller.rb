class UsersController < ApplicationController
	before_action :authenticate_user!

	def profile
	    @user = current_user
	    render 'users/profile'
	end

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def edit
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)

		respond_to do |format|
			if @user.save
				WelcomeMailer.welcome_email(@user).deliver_now
				format.html { redirect_to @user, notice: 'Usuario creado satisfactoriamente.' }
			else
				format.html { render :new }
			end
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		respond_to do |format|
			format.html { redirect_to courts_url, notice: 'Usuario eliminado satisfactoriamente.' }
    	end
	end

	def update
		@user = User.find(params[:id])
		respond_to do |format|
			if @user.update(user_params)
				format.html { redirect_to @user, notice: 'Usuario modificado satisfactoriamente.' }
			else
				format.html { render :edit }
			end
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :description, :direction, :level, :email, :last_name, :address, :number_of_street, :flat, :letter_flat, :zip_code, :mobile_number)
	end

end
