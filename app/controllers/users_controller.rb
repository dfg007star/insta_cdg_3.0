class UsersController < ApplicationController
  def index
    if user_signed_in?
      @users = User.all.order("name ASC")
    else 
      redirect_to new_user_session_path
    end
    
  end

  def show
    @user = User.find(params[:id])
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following
    render 'users/follow_show'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers
    render 'follow_show'
  end
end
