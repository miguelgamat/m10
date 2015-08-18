class Club < ActiveRecord::Base
	has_many :courts
	has_many :users, :through => :memberships
end
