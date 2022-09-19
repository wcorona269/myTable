class Review < ApplicationRecord
	validates :body, :overall, :food, :service, :ambience, :author_id, :rest_id, presence: true

	belongs_to :author,
			primary_key: :id,
			foreign_key: :author_id,
			class_name: :User
			
	belongs_to :restaurant,
			primary_key: :id,
			foreign_key: :rest_id,
			class_name: :Restaurant
end
