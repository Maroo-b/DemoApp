class Inviter < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.inviter.invite.subject
  #
  def invite(name,email)
    @greeting = "Hi #{name}"
    mail to: email, subject: "Test invitation"
  end
end
