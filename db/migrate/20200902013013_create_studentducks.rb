class CreateStudentducks < ActiveRecord::Migration[5.2]
  def change
    create_table :studentducks do |t|
      t.integer :student_id
      t.integer :duck_id
      t.timestamps
    end
  end
end
