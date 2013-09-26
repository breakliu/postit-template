class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = 'Create user successful!'
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @user = User.find(current_user.id)
    if @user.update_attributes(user_params)
      flash[:notice] = "Edit user successful!"
      redirect_to posts_path
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :password, :time_zone)
  end
end