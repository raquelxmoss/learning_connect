
def create_lo(courses)

  LearningObjective.delete_all
  courses = Course.all

  courses.each do |course|
    (rand 10).times do
      course.learning_objectives.create(objective: Faker::Lorem.sentence)
    end
  end

  puts "#{LearningObjective.count} objectives created"

  return LearningObjective.all

end