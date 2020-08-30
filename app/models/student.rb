class Student < ApplicationRecord
    has_many :ducks

    validates :name, :mod, presence: true
    validates :name, uniqueness: true
    validates :mod, numericality: {greater_than: 0, less_than: 6}

    def self.mods
        self.all.map {|student| student.mod}.uniq
    end
end