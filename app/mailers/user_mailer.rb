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
  def new_booking booking
      @user = booking.user
      @booking = booking
      @url  = 'http://example.com/login'
      mail(to: @user.email, subject: ' Confirmación de tu reserva')
  end
  def update_booking booking
      @user = booking.user
      @booking = booking
      @url  = 'http://example.com/login'
      mail(to: @user.email, subject: 'Tu reserva ha sido modificada')
  end
  def delete_booking booking
      @user = booking.user
      @booking = booking
      @url  = 'http://example.com/login'
      mail(to: @user.email, subject: 'Tu reserva ha sido eliminada')
  end
end