class ImitationsController < ApplicationController

  def new
    session[:admin_id] = current_user.id
    user = User.find(params[:user_id])
    session[:user_id] = user.id
    redirect_to root_path, notice: "Now imitating #{user.email}."
  end

  def create
  end

  def destroy
    user = User.find(session[:admin_id])
    session[:user_id] =  user.id
    session[:admin_id] = nil
    redirect_to admin_users_path, notice: "Imitation stopped."
  end

end
