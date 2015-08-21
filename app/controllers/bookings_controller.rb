class BookingsController < ApplicationController
	
	def index
		@bookings = Booking.all
		@courts = Court.all
	end

	def show
		@booking = Booking.find(params[:id])
		@user_courts = current_user.courts
	end

	def show_time
		render json: {status: "ok"}
	end

	def new
		@booking = Booking.new
		@user_courts = current_user.courts
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
			format.html { redirect_to bookings_url, notice: 'Pista eliminada satisfactoriamente.' }
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
		@user_courts = current_user.courts
	end

	private

	def booking_params
		params.require(:booking).permit(:name, :type_of_court, :date_booked, :time_booked, :court_id)
	end

end


# <!-- Time for the booking -->
# <% if @court %>
# 	<div class="field">
# 		<%= f.label :date_time_booked, 'Elige la fecha' %><br>
# 		<%= f.select(:date_time_booked) do %>
# 		<% Booking.show_availability(:court_id).each do |availability, key| -%>
# 		<%= content_tag(:option, availability.key , value: c.id) %>
# 			<% end %>
# 		<% end %>
# 	</div>
# <% end %>

