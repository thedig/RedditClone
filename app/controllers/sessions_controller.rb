class SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials( params[:session][:user_name],
                                      params[:session][:password])
    if @user
      login @user
      redirect_to subs_url
    else
      flash.now[:errors] = ["Invalid username or password"]
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_url

  end

  def new
    render :new
  end


end
