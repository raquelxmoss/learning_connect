class NotificationMailer < ApplicationMailer

  def new_connection(user, connection)
    @connection = connection
    @user = user
    @greeting = "Hi #{@user.name}"
    mail(to: @user.email)
  end

end
