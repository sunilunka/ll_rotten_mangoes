class Admin::UsersController < ApplicationController

  before_filter :restrict_access, :admin_access

  def index
    @users = User.all
  end

  def new 
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
  
    if @user.save
       redirect_to admin_users_path, notice: "New user #{@user.firstname} with email #{@user.email} created."
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update_attributes(user_params)
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    UserMailer.email_removed_user(@user).deliver
    @user.destroy
    redirect_to admin_users_path
  end

  protected

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :is_admin, :password, :password_confirmation)
  end


end
