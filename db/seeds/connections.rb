def create_connections users

  Connection.delete_all

  20.times do 

    duo = users.sample 2 
    Connection.create(initializer: duo[1], receiver: duo[0])

  end

  puts "#{Connection.count} connections created"

  return Connection.all  

end

