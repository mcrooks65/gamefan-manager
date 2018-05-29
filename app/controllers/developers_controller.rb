class DevelopersController < ApplicationController
  before_action :set_developer, only: [:show, :edit, :update, :destroy]

  def new
    @developer = Developer.new
  end

  def create
    @developer = Developer.new(developer_params)
    @developer.save
  end

  def show
    @message = params[:message] if params[:message]
    @message ||= false
  end

  def index
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
