class UserMailer < ApplicationMailer
    default from:'alhadiadam13@gmail.com'

      def welcome_email(user)
        @user = user
        @greeting = "Hi"
        mail(to: @user.email, subject: 'Welcome to Alodokter!')
      end

      def password_reset(user)
        @user = user
        @greeting = "Hi"
        mail(to: @user.email, subject: 'Reset password instruction')
      end

    # def send_welcome(user)
    #     @user = user
    #     @greeting = "Hi"
        
    #     mail to: user.email, subject: 'Welcome to our page!'
    # end

    # def forgot_password(user)
    #     @user = user
    #     @greeting = "Hi"
        
    #     mail to: user.email, :subject => 'Reset password instructions'
    #   end
end
