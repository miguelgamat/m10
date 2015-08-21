class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :court

  # def court_by_dates_availables court_id date
    
  # end

  def self.show_availability court_id
  	availability = []
  	court_bookings = Court.find_by(id: court_id).bookings

  	court_bookings.each do |booking|
  	if booking.date_time_booked
  		@all_availabilities.delete(booking)
  		end
  	end
  end

  def hash_with_timetable
  	numbers = (1...14).to_a
  	timetable = ["9:00 - 10:00", "10:00 - 11:00","11:00 - 12:00", "12:00 - 13:00", "13:00 - 14:00", "14:00 - 15:00", "15:00 - 16:00", "16:00 - 17:00", "17:00 - 18:00", "18:00 - 19:00", "19:00 - 20:00", "20:00 - 21:00", "21:00 - 22:00"]
  	@all_availabilities = Hash[numbers.zip(timetable)]
  end

end
