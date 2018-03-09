class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(user_params[:email], user_params[:password])

    if user.nil?
      flash.now[:errors] = user.errors.full_messages
      render :new
    else
      session[:session_token] = user.reset_session_token!
      redirect_to user_url(user)
    end
  end

  def destroy
    session[:session_token] = nil
    flash[:success] = "Successfully logged out!"
    redirect_to new_session_url
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
