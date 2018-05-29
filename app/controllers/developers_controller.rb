class DevelopersController < ApplicationController
  before_action :set_developer, only: [:show, :edit, :update, :destroy]

  def new
    @developer = Developer.new
  end

  def create
    @developer = Developer.new(developer_params)
    @developer.save
    redirect_to developer_path(@developer)
  end

  def show
    @message = params[:message] if params[:message]
    @message ||= false
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
        :location
      )
    end
end