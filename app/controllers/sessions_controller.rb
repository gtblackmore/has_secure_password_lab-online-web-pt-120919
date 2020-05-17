class SessionsController < ApplicationController

  def create
    user = User.find_by(name: params[:user][:name])
    user = user.try(:authenticate, params[:user][:password])
    if user
      session[:user_id] = user.id
      @user = user
      redirect_to root_path
    else
      redirect_to new_user_path
    end
  end

  def destroy
    session.delete :user_id
  end
end