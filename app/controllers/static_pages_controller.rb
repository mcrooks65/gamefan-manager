class StaticPagesController < ApplicationController
  def home
  end

  def tally
    @games = Game.all
    @devs = Developer.all
  end

end
