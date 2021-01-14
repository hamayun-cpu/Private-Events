class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome"
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    if current_user
      @user = current_user
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

end
