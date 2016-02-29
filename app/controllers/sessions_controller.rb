class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to user_path(@user)
    end
  end

  def create
    @user = User.find_by(email_address: params[:session][:email_address])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash.now[:error] = "Invalid Login. Try Again."
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
