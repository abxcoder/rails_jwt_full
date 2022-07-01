class Api::V1::UsersController < ApplicationController

    skip_before_action :authorized, only: [:create]

    def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def create
        emailnya = user_params[:email]
        passwordnya = user_params[:encrypted_password]
        pass_enc = BCrypt::Password.create(passwordnya)
        # byebug
        @user = User.create(email:emailnya, encrypted_password:pass_enc)
      if @user.valid?
        token = encode_token(user_id: @user.id)
        # byebug
        render json: { user: UserSerializer.new(@user), jwt: token }, status: :ok
      else
        render json: {
                 error: 'failed to create user',
               },
               status: :unprocessable_entity
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:email, :encrypted_password)
    end

  end
  