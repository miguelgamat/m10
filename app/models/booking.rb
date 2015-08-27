require 'json'

class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :court

  def self.court_availability court_id, date
    court_bookings = Court.find_by(id: court_id).bookings
    dates_booked = court_bookings.where(:date_booked => date)
    
    numbers = (1...14).to_a
    timetable = ["9:00 - 10:00", "10:00 - 11:00","11:00 - 12:00", "12:00 - 13:00", "13:00 - 14:00", "14:00 - 15:00", "15:00 - 16:00", "16:00 - 17:00", "17:00 - 18:00", "18:00 - 19:00", "19:00 - 20:00", "20:00 - 21:00", "21:00 - 22:00"]
    all_availabilities = Hash[numbers.zip(timetable)]
    
    dates_booked.each do |booking|
      if booking.time_booked
        all_availabilities.delete(booking.time_booked.to_i)
      end
    end
    all_availabilities

  end

  def self.show_time_from_hash number_time
    numbers = (1...14).to_a
    timetable = ["9:00 - 10:00", "10:00 - 11:00","11:00 - 12:00", "12:00 - 13:00", "13:00 - 14:00", "14:00 - 15:00", "15:00 - 16:00", "16:00 - 17:00", "17:00 - 18:00", "18:00 - 19:00", "19:00 - 20:00", "20:00 - 21:00", "21:00 - 22:00"]
    hash_time = Hash[numbers.zip(timetable)]
    hash_time[number_time]
  end

  def time_restriction
   
  end

  def time_from_now_plus_one_hour
   
  end
end
