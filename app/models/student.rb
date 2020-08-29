class Student < ApplicationRecord
    has_many :ducks, class_name: "Duck", foreign_key: "reference_id"
    validates :name, presence: :true
    validates :mod, numericality: {greater_than: 0, less_than: 6}


    def my_ducks
        Duck.all.select {|duck| duck.student_id == self.id}
    end

end

