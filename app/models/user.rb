class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
	has_many :bookings
	has_many :memberships
	has_many :clubs, :through => :memberships
	has_many :courts, :through => :clubs

	def self.invite! email
		User.invite!({:email => email})
	end

end
