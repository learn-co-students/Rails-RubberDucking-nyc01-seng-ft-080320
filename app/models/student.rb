class Student < ApplicationRecord
    has_many :studentducks
    has_many :ducks, through: :studentducks

    validates :mod, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
    validates :name, uniqueness: true
end
