class SessionsController < ApplicationController
  #before_action :check_on_login
  def create
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      session[:user_name] = user.username
      redirect_to root_path
    else
      flash[:notice] = "User or password not correct"
      redirect_to '/login'
    end
  end

  def destroy
    session.delete(:user_id)
    session.delete(:user_name)
    redirect_to '/login', alert: "User logged out :D"
  end

  private
    def check_on_login
      if session[:user_name]
        redirect_to root_path
      end
    end
end
