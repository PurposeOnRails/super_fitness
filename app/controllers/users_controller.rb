class UsersController < ApplicationController
  before_action :redirect_if_logged_in, only: [:new, :create]
  before_action :redirect_if_not_authorized, only: :show

  before_action :set_user, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "You've been logged in"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name, :email, :password, :password_confirmation,
      :date_of_birth, :gender, :phone_number
    )
  end

  private

    def redirect_if_logged_in
      if logged_in?
        redirect_to user_path(current_user)
      end
    end

    def redirect_if_not_authorized
      if params[:id] != current_user.id.to_s
        redirect_to user_path(current_user)
      end
    end

    def set_user
      @user = User.find(params[:id])
    end
end
