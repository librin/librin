class Librinmail < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.librinmail.welcome.subject
  #
  def welcome
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.librinmail.suggestion.subject
  #
  def suggestion sender, resource, user
    
    puts "estamos aqui"
    @resource = resource
    @sender = sender
    @user = user
    
    mail(to: "irene.morenocano@gmail.com", subject: 'Te recomiendan este libro')
    return
    
  end
end
