def create_courses(connections)

  Course.delete_all

  connections.each do |connection|
    users = [connection.initializer, connection.receiver].shuffle

    rand(2).times do 

      options ={
        title: Faker::Lorem.sentence,
        status: Faker::Lorem.paragraph,
        tutor:users[0],
        learner: users[1],
        connection: connection
      }

      Course.create(options)
    end

  end

  puts "#{Course.count} courses created"

  return Course.all
  
end







