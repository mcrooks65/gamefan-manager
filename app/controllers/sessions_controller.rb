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
    #OAUTH START
    dev = Developer.from_omniauth(env["omniauth.auth"])
    if dev.valid?
      session[:user_id] = user.id
      redirect_to request.env['omniauth.origin']
    end
    #OAUTH END
    @dev = Developer.find_by(id: params[:developer][:id])
    if @dev && @dev.authenticate(params[:developer][:password])
      session[:dev_id] = @dev.id
      redirect_to @dev
    else
      redirect_to '/login'
    end
  end
end
