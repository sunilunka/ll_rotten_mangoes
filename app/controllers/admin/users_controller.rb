class Admin::UsersController < ApplicationController

  before_filter :restrict_access, :admin_access

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    binding.pry
    @user.destroy
    redirect_to admin_users_path
  end


end
