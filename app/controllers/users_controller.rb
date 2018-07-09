class UsersController < ApplicationController
  before_action :redirect_if_logged_in, only: [:new, :create]
  before_action :redirect_if_not_authorized, only: [:show, :edit]
  before_action :set_purposes, only: [:edit]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
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
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Your Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name, :gender, :date_of_birth, :phone_number # :password, :password_confirmation
    )
  end

  def set_purposes
    @purposes = Purpose.all
  end


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
end
