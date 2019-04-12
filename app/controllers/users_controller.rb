class UsersController < ApplicationController
  include SessionsHelper

  before_action :set_user, only: [:show]
  before_action :logged_in , only: [:show]
  before_action :correct_user , only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render "new"
    end
  end

  def show
    @upcoming_events = @user.upcoming_events
    @prev_events = @user.previous_events
  end

   private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name)
  end

  def logged_in
    redirect_to root_path unless current_user
  end

  def correct_user
    redirect_to root_path unless current_user == @user
  end
end
