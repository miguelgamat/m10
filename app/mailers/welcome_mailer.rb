class WelcomeMailer < ApplicationMailer

	default from: miguelgamat@gmail.com

	def welcomeMail(user)
		@user = user
		mail(to: @user.email, subject: 'Bienvenido a M10, #{@user.name}')
	end
end
