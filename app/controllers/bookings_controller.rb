require 'json'
require 'date'

class BookingsController < ApplicationController
	before_action :authenticate_user!

	def index
		@bookings = Booking.all
		@courts = Court.all
	end

	def show
		@booking = Booking.find(params[:id])
		@user_courts = current_user.courts
	end

	def show_time
		date = Date.new(params[:booking]["date_booked(1i)"].to_i,params[:booking]["date_booked(2i)"].to_i,params[:booking]["date_booked(3i)"].to_i )
		@booking = Booking.court_availability(params[:booking][:court_id], date)
		render json: @booking
	end

	def new
		@booking = Booking.new
		@user_id = current_user.id
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
		params.require(:booking).permit(:name, :type_of_court, :date_booked, :time_booked, :court_id, :user_id)
	end

end


# <!-- Time for the booking -->
# <% if @court %>
# 	<div class="field">
# 		<%= f.label :date_booked, 'Elige la fecha' %><br>
# 		<%= f.select(:date_booked) do %>
# 		<% Booking.show_availability(:court_id).each do |availability, key| -%>
# 		<%= content_tag(:option, availability.key , value: c.id) %>
# 			<% end %>
# 		<% end %>
# 	</div>
# <% end %>