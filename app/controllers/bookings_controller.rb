class BookingsController < ApplicationController
	
	def index
		@bookings = Booking.all
		@courts = Court.all
	end

	def show
		@booking = Booking.find(params[:id])
	end

	def new
		@booking = Booking.new
		@clubs = Club.all
		@user_clubs = current_user.clubs.map {|club| [club.name, club.id]}
		@user_courts = current_user.courts.map {|court| [court.name, court.id]}
	end


	def create
		@booking = Booking.new(booking_params)

		respond_to do |format|
			if @booking.save
				format.html { redirect_to @booking, notice: 'Pista creada satisfactoriamente.' }
			else
				format.html { render :new }
			end
		end
	end

	def destroy
		@booking = Booking.find(params[:id])
		@booking.destroy
		respond_to do |format|
			format.html { redirect_to courts_url, notice: 'Pista eliminada satisfactoriamente.' }
    	end
	end

	def update
		@booking = Booking.find(params[:id])
		respond_to do |format|
			if @booking.update(booking_params)
				format.html { redirect_to @booking, notice: 'Pista modificada satisfactoriamente.' }
			else
				format.html { render :edit }
			end
		end
	end

	def edit
		@booking = Booking.find(params[:id])
	end

	private

	def booking_params
		params.require(:booking).permit(:name, :type_of_court)
	end

end


 #  	<div class="field">
	#   <%= f.label :club_id, 'Elige tu club' %><br>
	#   <%= f.select(:club_id) do %>
	#     <% [@user_clubs].each do |c| -%>
	#       <%= content_tag(:option, c.first, value: c.last) %>
	#     <% end %>
	#   <% end %>
	# </div>
