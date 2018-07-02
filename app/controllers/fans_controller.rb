class FansController < ApplicationController
  def new
    @fan = Fan.new
  end

  def create
    @fan = Fan.new(fan_params)
    respond_to do |format|
      if @fan.save
        format.html { redirect_to @fan, notice: 'Fan was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
  end

  def index
  end

  def edit
  end

  private

  def fan_params
    params.require(:fan).permit(:name, :game_id)
  end

end
