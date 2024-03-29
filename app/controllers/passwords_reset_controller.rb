class PasswordsResetController < ApplicationController
    def edit
        @user = User.find_signed!(params[:token], purpose: "password_reset")
    rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_to sign_in_path, alert: "Your token has expired, please try again"
    end

    def update
        @user = User.find_signed!(params[:token], purpose: "password_reset")

        if @user.update(password_params)
            redirect_to sign_in_path, notice: "Your password reset successfully, please sign in."
        else
            render :edit
        end
    end

    private
    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end
end