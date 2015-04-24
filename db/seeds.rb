require_relative "seeds/users"
require_relative "seeds/connections"
require_relative "seeds/messages"
require_relative "seeds/courses"
require_relative "seeds/learning_objectives"
require_relative "seeds/ratings"
require_relative "seeds/skills"



users = create_users
skills = create_skills(users)
connections = create_connections(users)
messages = create_messages(connections)
courses = create_courses(connections) 
lo = create_lo(courses)
ratings = create_ratings(courses)
