class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    #binding.pry
    username = params[:username]
    password = params[:password]
    @user = User.find_by username: username
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      flash[:notice] = 'Login logined in.'
      redirect_to root_path
    else
      flash[:alert] = 'Login failed, please relogin.'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Logout !'
    redirect_to root_path
  end

  private
  def set_sessions
  end
end