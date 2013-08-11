class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create user_params

    if @user
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    user = User.find params[:id]
    user.destroy

    redirect_to root_url, status: 303
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :born_on, :is_male)
  end

end
