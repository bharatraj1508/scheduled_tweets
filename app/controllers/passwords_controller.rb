class PasswordsController < ApplicationController
    before_action :require_user_loggged_in!, only: [:edit, :update] 

    def edit
    end

    def update
        if Current.user.update(password_params)
            redirect_to root_path, notice: "Password updated!"
        else
            render :edit
        end
    end

    def new
    end

    def create
        @user = User.find_by(email: params[:email])

        if @user.present?
            #send the email
            PasswordMailer.with(user: @user).reset.deliver_now
            redirect_to root_path, notice: "If an account with the email is found, we have sent the instruction to reset password"
        else
            redirect_to root_path, notice: "If an account with the email is found, we have sent the instruction to reset password"
        end
    end

    private
    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end
end