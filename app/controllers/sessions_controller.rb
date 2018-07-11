class SessionsController < ApplicationController
  def destroy
    session.destroy
    redirect_to '/'
  end

  def new
    @dev = Developer.new
    @devs = Developer.all
  end

  def create
    user = User.from_omniauth(env["omniauth.auth"])

    if user.valid?
      session[:user_id] = user.id
      redirect_to request.env['omniauth.origin']
    end

    @dev = Developer.find_by(id: params[:developer][:id])
    if @dev && @dev.authenticate(params[:developer][:password]) #Why won't this line work?
      session[:dev_id] = @dev.id
      redirect_to @dev
    else
      redirect_to '/login'
    end
  end
end
