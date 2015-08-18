class Court < ActiveRecord::Base
  belongs_to :club
  belongs_to :booking
end
