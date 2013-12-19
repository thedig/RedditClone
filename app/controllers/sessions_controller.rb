class SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials( params[:session][:username],
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
  end

  def new
    render :new
  end


end
