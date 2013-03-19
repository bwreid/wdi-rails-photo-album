class SessionController < ApplicationController
  def new
  end

  def create
    user = User.where( :username => params[:username] ).first

    if user.present? && user.authenticate( params[:password] )
      session[:user_id] = user.id
    else
      session[:user_id] = nil
    end

    authentication
  end

  def destroy
    session[:user_id] = nil
    @auth = nil
  end

end