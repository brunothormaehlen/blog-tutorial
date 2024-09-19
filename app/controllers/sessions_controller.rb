class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:login][:email])
    if User.authenticate(user&.email, params[:login][:password])
      session[:admin_user_id] = user.id
      redirect_to admin_root_path
    else
      render :new
    end
  end
end
