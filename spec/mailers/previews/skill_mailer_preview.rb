# Preview all emails at http://localhost:3000/rails/mailers/skill_mailer
class SkillMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/skill_mailer/skill_add
  def skill_add
    SkillMailer.skill_add
  end

  # Preview this email at http://localhost:3000/rails/mailers/skill_mailer/skill_delete
  def skill_delete
    SkillMailer.skill_delete
  end

end
