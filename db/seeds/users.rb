User.delete_all

User.create(emai:'barretalexandre@hotmail.com', passsword:'cookie')
User.create(emai:'john.kan@virtuosity.co.nz', passsword:'cookie')
User.create(emai:'raquelxmoss@gmail.com', passsword:'cookie')
User.create(emai:'dhara.dhara.009@gmail.com', passsword:'cookie')

10.times do 

  User.create(email: Faker::Name.name, password:'cookie' )

end

