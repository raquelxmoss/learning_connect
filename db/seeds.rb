require_relative "seeds/users"
require_relative "seeds/connections"
require_relative "seeds/messages"
require_relative "seeds/courses"



users = create_users
connections = create_connections users
messages = create_messages(connections)
courses = create_courses(connections)


