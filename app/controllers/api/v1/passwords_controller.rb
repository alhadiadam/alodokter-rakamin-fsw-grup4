module Api
  module V1
      class PasswordsController < ApplicationController
        
        def new
          end

          def reset_edit
            @token = params[:token].to_s
            @user = User.find_by(password_reset_token: @token)
          end
          
          def forgot
            if params[:email].blank? # check if email is present
              return render json: {error: 'Email not present'}
            end
        
            user = User.find_by(email: params[:email]) # if present find user by email
        
            if user.present?
              user.generate_password_token! #generate pass token
              # SEND EMAIL HERE
              UserMailer.password_reset(user).deliver_now
              render json: {
                status: 'ok',
                message:'Your password has been requested to reset',
                }, status: :ok
            else
              render json: {error: ['Email address not found. Please check and try again.']}, status: :not_found
            end
          end
          
        
          def reset
            @token = params[:token].to_s
            # if params[:email].blank?
            #   return render json: {error: 'Token not present'}
            # end
            @user = User.find_by(password_reset_token: @token)
          
            if @user.present? && @user.password_token_valid?
              if @user.password_reset!(params[:password])
                render json: {
                  status: 'ok',
                  message:'Successfully Reset Password!'
                  }, status: :ok
              else
                render json: {status:'error',
                  message: 'Cannot Reset Password!'
                  }, status: :unprocessable_entity
              end
            else
              render json: {
                status:'error',
                message:'Generate new link for reset password!',
              }, status: :unprocessable_entity
            end
          end
          # @user = User.new(params[:password])
          # # @user = User.find_by(password_reset_token: @token)
          # if @user.present? && @user.password_token_valid?
          #    @user =User.find_by(password_reset_token: @token)
          #   if @user.update_attributes(params[:password])
          #     flash[:success] = "Your Password has been successfully reset!"
          #   else 
          #     flash[:danger] = "Your Password reset link has been expired!"
          #   end
          # end

      end
  end
end
