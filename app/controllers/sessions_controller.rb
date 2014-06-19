class SessionsController < ApplicationController

  def index
    if current_user
      redirect_to achievements_path
    end
  end

 def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to achievements_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
