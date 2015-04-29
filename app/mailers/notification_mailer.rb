class NotificationMailer < ApplicationMailer

  def new_connection(user, connection)
    @connection = connection
    @greeting = "Hi #{user.name}"
    mail to: user.email
  end

end
