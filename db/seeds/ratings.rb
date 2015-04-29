def create_ratings courses
  Rating.delete_all

  courses.each do |course|

    course.ratings << Rating.create(rating_type: 'tutor_rate_learner', rating: rand(5) )
    course.ratings << Rating.create(rating_type: 'learner_rate_tutor', rating: rand(5) )


  end

  puts "#{Rating.count / 2 } ratings pair created"

  return Rating.all

end