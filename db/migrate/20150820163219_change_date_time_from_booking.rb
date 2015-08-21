class ChangeDateTimeFromBooking < ActiveRecord::Migration
  def self.up
  	change_column :bookings, :date_time_booked, :string
  end

  def self.down
  	 change_column :bookings, :date_time_booked, :datetime
  end

end
