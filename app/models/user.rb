class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

	validates_presence_of :name, :email
	# validates :phone_number, format: /\(?(\d{3})\)?[\W\D]?(\d{3})[\W\D]?(\d{4})/
	validates :email, format: /\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\b/

	has_many :bookings
	has_many :memberships
	has_many :clubs, :through => :memberships
	has_many :courts, :through => :clubs

end
