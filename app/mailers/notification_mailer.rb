class NotificationMailer < ApplicationMailer

  def new_connection(user, connection)
    @connection = connection
    @greeting = "Hi #{user.name}"
    mail to: 'barret.alx@gmail.com'
  end

end
