class Club < ActiveRecord::Base
	has_many :courts
	has_many :memberships
	has_many :users, :through => :memberships

	after_validation :geocode
	geocoded_by :address

	has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#"}
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
  