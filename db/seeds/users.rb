def create_users
  User.delete_all
  User.create(name: 'Alex Barret', email:'barretalexandre@hotmail.com', password:'password', about: Faker::Lorem.paragraph, lat: -41.251268 , long: 174.773239)
  User.create(name: 'John Kan', email:'john.kan@virtuosity.co.nz', password:'password',about: Faker::Lorem.paragraph, lat: -41.222619, long: 174.805416)
  User.create(name: 'Raquel Moss', email:'raquelxmoss@gmail.com', password:'password',about: Faker::Lorem.paragraph, lat: -41.244257, long: 174.791135)
  User.create(name: 'Dhara Panda', email:'dhara.dhara.009@gmail.com', password:'password', about: Faker::Lorem.paragraph, lat: -41.283755, long:174.740875)

  10.times do
    User.create(name: Faker::Name.name, email: Faker::Internet.email, password:'password', about:Faker::Lorem.paragraph, lat: -(41.0 + rand), long: (174.0 + rand))
  end

  puts "#{User.count} users created !"

  return User.all

end
