module Api
    module V1
        class UsersController < ApplicationController
            def new
                
              end
            # register a user
            def create
                # check if the user already exists
                if User.exists?(email: params[:email])
                    render json: {
                        status: 'Error',
                        message: 'User already exists',
                    },
                    status: :unprocessable_entity
                else
                    # create a new user object and save it to the database
                    user = User.new(user_params)
                    if user.save
                        # generate token for the user
                        # token = encode_token({user_id: user.id, fullname: user.fullname, email: user.email, address: user.address, IdCardNumber: user.IdCardNumber, BirthDate: user.BirthDate, gender: user.gender})
                        # UserMailer.send_welcome(user).deliver_now
                        UserMailer.welcome_email(user).deliver_now
                        render json: {
                            status: 'success',
                            message: 'User created',
                            data: user,
                            # token: token,
                        },
                        status: :created
                    else 
                        render json: {
                            status: 'error',
                            message: 'User not created',
                            data: user.errors,
                        },
                        status: :unprocessable_entity
                    end
                end
            end

            def show
               if user = User.find_by_email(params[:email])
                render :json => {
                    data: user,
                    status: 'success',
                    message: 'User Found',
                }, status: :ok
            
                else 
                render json: {
                    status: 'error',
                    message: 'User not Found',
                },
                status: :not_found
                end
            end

            def update
                # find the user in the DB using their email
                user = User.find_by_email(params[:email])
                user.update(update_params)
                render :json =>{
                    data: user,
                    status: 'success',
                    message: 'Profile Updated!'
                }, status: :ok

                rescue ActiveRecord::RecordNotFound => e
                    render json: {
                        status: 'error',
                        message: 'Update Cancelled!'
                    }, status: :unprocessable_entity
            end

            # login a user
            def login
                # find the user in the DB using their email
                user = User.find_by_email(params[:email])
                # check if the user exists and password is authenticate
                if user&.authenticate(params[:password])
                    # generate user token
                    token = encode_token({user_id: user.id, fullname: user.fullname, email: user.email})
                    render json: {
                        status: 'success',
                        message: 'Login successful',
                        data: user,
                        token: token,
                    },
                    status: :ok
                else
                    render json: {
                        status: 'error',
                        message: 'Incorrect email or password',
                    },
                    status: :unprocessable_entity
                end 
            end
            
            private
            def user_params
                params.permit(:fullname, :email, :password, :address, :IdCardNumber, :BirthDate, :gender)
            end
            def update_params
                params.permit(:id, :fullname, :email, :password, :address, :IdCardNumber, :BirthDate, :gender)
            end
            
            # token hash secret
            SECRET_KEY = Rails.application.secrets.secret_key_base. to_s
      
            # token generator method using the secret
            def encode_token(payload, exp = 24.hours.from_now)
            payload[:exp] = exp.to_i
            JWT.encode(payload, SECRET_KEY) 
            end

        end
    end
end