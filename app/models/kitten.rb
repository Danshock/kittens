class Kitten < ApplicationRecord
	validates :name, presence: true, length: { minimum: 2 }
	validates :age,  presence: true
	validates :cuteness, presence: true, length: { minimum: 2, maximum: 20 }
	validates :softness, presence: true, length: { minimum: 2, maximum: 20 }
end
