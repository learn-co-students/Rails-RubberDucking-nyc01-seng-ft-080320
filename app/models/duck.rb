class Duck < ApplicationRecord
    has_many :studentducks
    has_many :ducks, through: :studentducks

    validates :name, uniqueness: true
    validates :name, presence: true

end
