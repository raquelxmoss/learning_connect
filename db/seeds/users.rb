def create_users

  User.delete_all

  User.create(name: 'alex', email:'barretalexandre@hotmail.com', password:'password')
  User.create(name: 'john', email:'john.kan@virtuosity.co.nz', password:'password')
  User.create(name: 'raquel', email:'raquelxmoss@gmail.com', password:'password')
  User.create(name: 'dhara', email:'dhara.dhara.009@gmail.com', password:'password')

  10.times do

    User.create(name: Faker::Name.name, email: Faker::Internet.email, password:'password' )

  end

  puts "#{User.count} users created !"

  return User.all

end
