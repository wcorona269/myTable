class Review < ApplicationRecord
	# skip_before_action :verify_authenticity_token
	validates :body, :overall, :food, :service, :ambience, presence: true

	belongs_to :author,
			primary_key: :id,
			foreign_key: :author_id,
			class_name: :User

	belongs_to :restaurant,
			primary_key: :id,
			foreign_key: :rest_id,
			class_name: :Restaurant

	# belongs_to :booking,
	# 	primary_key: :id,
	# 	foreign_key: :booking_id,
	# 	class_name: :Booking
end
