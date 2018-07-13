class DevelopersController < ApplicationController
  before_action :set_developer, only: [:show, :edit, :update, :destroy]

  def new
    @developer = Developer.new
  end

  def create
    @developer = Developer.new(developer_params)
    if @developer.save
      session[:dev_id] = @developer.id
      redirect_to developer_path(@developer)
    else
      render :new
    end
  end

  def show
    @message = params[:message] if params[:message]
    @message ||= false
    if session[:dev_id]
      @games = @developer.games
    else
      redirect_to login_path
    end
  end

  def index
    @developers = Developer.all
  end

  def edit
  end

  private

    def set_developer
      @developer = Developer.find(params[:id])
    end

    def developer_params
      params.require(:developer).permit(
        :name,
        :employees,
        :location,
        :password,
        :password_confirmation
      )
    end
end
