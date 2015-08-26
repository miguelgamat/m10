class ClubsController < ApplicationController
	before_action :authenticate_user!

	def index
		@clubs = Club.all
		@current_user_clubs = current_user.clubs
	end

	def show
		@club = Club.find(params[:id])
		@hash = Gmaps4rails.build_markers(@club) do |club, marker|
		  marker.lat club.latitude
		  marker.lng club.longitude
		  marker.infowindow club.name
		end
	end

	def new
		@club = Club.new
		@membership = Membership.new
	end

	def create
		@club = Club.new(club_params)

		respond_to do |format|
			if @club.save
				@membership = Membership.new(club_id: @club.id, user_id: current_user.id)
				@membership.save
				format.html { redirect_to @club, notice: 'Club/comunidad ha sido creado satisfactoriamente.' }
			else
				format.html { render :new }
			end
		end
	end

	def destroy
		@club = Club.find(params[:id])
		@club.destroy
		respond_to do |format|
			format.html { redirect_to clubs_url, notice: 'Club/comunidad ha sido eliminado satisfactoriamente.' }
		end
	end

	def update
		@club = Club.find(params[:id])
		respond_to do |format|
			if @club.update(club_params)
				format.html { redirect_to @club, notice: 'Club se ha modificado satisfactoriamente.' }
			else
				format.html { render :edit }
			end
		end
	end


	def edit
		@club = Club.find(params[:id])
	end

	private

	def club_params
		params.require(:club).permit(:name, :description, :address, :longitude, :latitude, :image)
	end
end
