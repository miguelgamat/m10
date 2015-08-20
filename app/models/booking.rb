class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :court

  def show_availability court_id
  	availability = {}
  	bookings = Booking.all
  	court_booked = bookings.date_time_booked
  	
  	each do |check_availability|
  	if Booking.find(court_id)!
  		end
  	end
  end

end
