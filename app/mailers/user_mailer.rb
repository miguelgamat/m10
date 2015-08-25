class UserMailer < ApplicationMailer
  default from: 'miguelgamat@gmail.com'
  def welcome_email(user)
      @user = user
      @url  = 'http://example.com/login'
      mail(to: @user.email, subject: 'Welcome')
  end
  def invitation_email(user)
      @user = user
      @url  = 'http://example.com/login'
      mail(to: @user.email, subject: ' Aplicación web para reservar pista')
  end
end