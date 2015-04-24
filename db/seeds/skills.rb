def create_skills users

  Skill.delete_all
  
  # code in here !
  users.each do |user|  	
  	rand(1..5).times do
  		user.skills << Skill.create( description: "to  #{Faker::Hacker.verb} things", skill_type: 'teach' )
  	end
  end

  users.each do |user|  	
  	rand(1..5).times do
  		user.skills << Skill.create( description: "to  #{Faker::Hacker.verb} stuff", skill_type: 'learn' )
  	end
  end

  puts "#{Skill.count} skills created"

  return Skill.all
  
end