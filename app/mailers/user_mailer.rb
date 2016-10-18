class UserMailer < ApplicationMailer
  default from: "from@example.com"
  def contact_form(email, name, message)
    @message = message
    mail(:from => email,
         :to => 'michael.irschick@gmail.com',
         :subject => "A new contact form message from #{name}")
  end

  def send_new_user_message(user)
    @message = 'message'
    mail(:from => 'email.com',
         :to => 'michael.irschick@gmail.com',
         :subject => 'A new user signed up')
  end

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

end
