class Duck < ApplicationRecord
    belongs_to :student, class_name: "Student", foreign_key: "student_id"
    validates :name, presence: :true
    validates :description, presence: :true
    validates :student_id, numericality: {greater_than: 0, less_than: Student.all.count}

    def my_owners
        Student.all.select {|student| student.id == self.student_id}
    end
end


