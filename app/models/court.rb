class Court < ActiveRecord::Base
  belongs_to :club
  has_many :bookings

end
