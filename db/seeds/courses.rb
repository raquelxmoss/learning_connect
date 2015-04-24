def create_courses(connections)

  Course.delete_all

  puts "#{Course.count} courses created"

  return Course.all
  
end




