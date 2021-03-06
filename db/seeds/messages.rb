def create_messages(connections)

  Message.delete_all


 connections.each  do |connection| 
    (rand 10).times do 
      options = {
        content: Faker::Lorem.paragraph,
        user_id: choose_user(connection),
        connection: connection
      }

      Message.create(options)
    end
  end

  puts "#{Message.count} messages created"

  return Message.all

end


def choose_user connection
    return [connection.receiver.id, connection.initializer.id].sample
end


