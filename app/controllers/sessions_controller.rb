class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Password or email not valid'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end

  private

    def redirect_if_logged_in
      if logged_in?
        redirect_to user_path(current_user)
      end
    end
end
