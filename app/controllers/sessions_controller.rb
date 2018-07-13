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
    # w/ OAUTH 
    if auth_hash = request.env["omniauth.auth"]
      @dev = Developer.from_omniauth(request.env["omniauth.auth"])
      if @dev.valid?
        session[:dev_id] = @dev.id
      end
    end
    if session[:dev_id] == nil # If session does not exist must be regular login
      @dev = Developer.find_by(id: params[:developer][:id])
    end
    if @dev.name == 'GithubProfile'
      redirect_to tally_path
    elsif @dev && @dev.authenticate(params[:developer][:password])
      session[:dev_id] = @dev.id
      redirect_to @dev
    else
      redirect_to '/login'
    end
  end
end
