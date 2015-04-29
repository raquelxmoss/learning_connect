require "rails_helper"

RSpec.describe SkillMailer, type: :mailer do
  describe "skill_add" do
    let(:mail) { SkillMailer.skill_add }

    xit "renders the headers" do
      expect(mail.subject).to eq("Skill add")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    xit "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "skill_delete" do
    let(:mail) { SkillMailer.skill_delete }

    xit "renders the headers" do
      expect(mail.subject).to eq("Skill delete")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    xit "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
