class GamesController < ApplicationController
  def new
    @game = Game.new
    @dev = Developer.find(params[:developer_id])
  end

  def create
    @game = Game.create(game_params)
    binding.pry
    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def index
    @games = Game.all
  end

  private

  def game_params
    params.require(:game).permit(:title, :description, :genre, :price, :developer_id)
  end
end
