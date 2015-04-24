def create_skills users

  Skill.delete_all

  # code in here !


  puts "#{Skill.count} skills created"

  return Skill.all
  
end