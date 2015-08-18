class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.datetime :date_time_booked
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :court, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

