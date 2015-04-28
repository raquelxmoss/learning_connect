class SkillMailer < ApplicationMailer
  # default from: "john.kan@virtuosity.co.nz"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.skill_mailer.skill_add.subject
  #
  
  def skill_add(skill)
    @greeting = "Hi from Rails!!!! local, added skill"
    @user_id = skill.user_id
    mail to: "john.kan@virtuosity.co.nz"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.skill_mailer.skill_delete.subject
  #
  def skill_delete
    @greeting = "Hi from Rails!!! local, deleted skill"
    @user_id = skill.user_id
    mail to: "john.kan@virtuosity.co.nz"
  end
end
