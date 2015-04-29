def create_users
  User.delete_all
  User.create(name: 'Alex Barret', email:'barretalexandre@hotmail.com', password:'password', about: Faker::Lorem.paragraph)
  User.create(name: 'John Kan', email:'john.kan@virtuosity.co.nz', password:'password',about: Faker::Lorem.paragraph)
  User.create(name: 'Raquel Moss', email:'raquelxmoss@gmail.com', password:'password',about: Faker::Lorem.paragraph)
  User.create(name: 'Dhara Panda', email:'dhara.dhara.009@gmail.com', password:'password', about: Faker::Lorem.paragraph)

  10.times do
    User.create(name: Faker::Name.name, email: Faker::Internet.email, password:'password', about:Faker::Lorem.paragraph )
  end

  puts "#{User.count} users created !"

  return User.all

end
