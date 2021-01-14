class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def users_params
    paramas.require(:user).permit(:name)
  end

end
