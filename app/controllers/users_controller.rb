class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = 'Welcome'
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = current_user if current_user
    @past_events = current_user.created_events.past
    @upcoming_events = current_user.created_events.future
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
