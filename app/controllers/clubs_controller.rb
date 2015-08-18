class ClubsController < ApplicationController

	def index
		@clubs = Club.all
	end

	def show
		@club = Club.find(params[:id])
	end

	def new
		@club = Club.new
	end

	def create
		@Club = Club.new(club_params)

		respond_to do |format|
			if @Club.save
				format.html { redirect_to @Club, notice: 'Club/comunidad ha sido creado satisfactoriamente.' }
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
		params.require(:club).permit(:name, :description)
	end
end
