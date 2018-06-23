class GamesController < ApplicationController
  def new

  end

  def create
  end

  def show
  end

  def index
    @games = Game.all
  end
end
