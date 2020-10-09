class HomeController < ApplicationController
  def index
  end

  def join_game
    @player = Player.new
  end

  def create_player
    @room = Room.find(game_params.slice(:room_code))
    @player = Player.new(game_params.splice(:name), room: @room)
    if @player.save
      session[:player_id] = @player.id
      @player.update(room: @room)
      redirect_to room_path(@room)
    else
      render :join_game
    end
  end

  def new_game
    @player = Player.new
  end

  def create_game
    @room = Room.new
    @player = Player.new(player_params.slice(:name).merge(room: @room))
    if @room.save && @player.save
      session[:player_id] = @player.id
      @player.update(room: @room)
      redirect_to room_path(@room)
    else
      puts 'error'
      render :new_game
    end
  end

  private

  def player_params
    params.require(:player).permit(:name)
  end

  def game_params
    params.require(:player).permit(:name, :room_code)
  end
end
