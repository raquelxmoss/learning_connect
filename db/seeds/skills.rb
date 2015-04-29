def create_skills users

  Skill.delete_all

  skills = ["Swing Dancing", "Spanish", "Cake decoration", "Hip hop", "Party planning", "WordPress", "Ruby on Rails", "Singing", "Piano", "Wind surfing", "Embroidery", "Crochet", "CSS", "Cycling", "Raspberry Pi", "Robotics", "Film editing", "Using an eReader", "Small business accounting", "Sketching", "Painting with Watercolours", "Ceramics", "C#", "Javascript", "Ruby", "HTML", "Knitting", "Salsa dancing"]
  # code in here !
  users.each do |user|
  	rand(1..5).times do
  		user.skills << Skill.create( description: skills.sample, skill_type: 'teach' )
  	end
  end

  users.each do |user|
  	rand(1..5).times do
  		user.skills << Skill.create( description: skills.sample, skill_type: 'learn' )
  	end
  end

  puts "#{Skill.count} skills created"

  return Skill.all

end