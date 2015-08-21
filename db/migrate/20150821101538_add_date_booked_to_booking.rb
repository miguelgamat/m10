class AddDateBookedToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :date_booked, :date
  	rename_column :bookings, :date_time_booked, :time_booked
  end
end
