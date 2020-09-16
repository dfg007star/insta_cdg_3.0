# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    if user_signed_in?
      @users = User.paginate(page: params[:page]).order('name ASC')
    else
      redirect_to new_user_session_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def following
    @title = 'Following'
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page]).order('name ASC')
    render 'users/follow_show'
  end

  def followers
    @title = 'Followers'
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page]).order('name ASC')
    render 'follow_show'
  end
end
