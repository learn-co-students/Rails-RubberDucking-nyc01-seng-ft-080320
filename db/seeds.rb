20.times do
  Student.create(name: Faker::Name.name, mod: rand(1..5))
end

60.times do
  Duck.create(name: Faker::Creature::Dog.name, description: Faker::Creature::Dog.breed )
end

100.times do
  Studentduck.create(student_id: Student.all.sample.id ,duck_id: Duck.all.sample.id)
end


