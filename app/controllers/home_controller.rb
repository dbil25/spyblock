class HomeController < ApplicationController
  def index
  end

  def join_game
  end

  def create_player
  end

  def new_game
    @player = Player.new
  end

  def create_game
  end
end
