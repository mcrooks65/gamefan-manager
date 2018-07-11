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
    @dev = Developer.find_by(id: params[:developer][:id])
    if @dev && @dev.authenticate(params[:developer][:password]) #Why won't this line work?
      session[:dev_id] = @dev.id
      redirect_to @dev
    else
      redirect_to '/login'
    end
  end
end
