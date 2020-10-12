class HomeController < ApplicationController
  include CableReady::Broadcaster

  def index
  end

  def join_game
    @player = Player.new
  end

  def create_player
    @room = Room.includes(:players).find_by(code: game_params[:room_code])
    @player = Player.new(game_params.slice(:name).merge(room: @room))
    if @player.save
      session[:player_id] = @player.id
      @player.update(room: @room)
      cable_ready["room_#{@room.id}"].dispatch_event(
        name: "room:joined", detail: {
          player_name: @player.name,
          player_color: @player.color
        }
      )
      cable_ready.broadcast
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
