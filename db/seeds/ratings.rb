def create_ratings courses
  Rating.delete_all

  courses.each do |course|

    course.ratings << Rating.create(rating_type: 'a', rating: rand(5) )
    course.ratings << Rating.create(rating_type: 'b', rating: rand(5) )


  end

  puts "#{Rating.count / 2 } ratings pair created"

  return Rating.all
  
end