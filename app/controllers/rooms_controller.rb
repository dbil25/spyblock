class RoomsController < ApplicationController
  before_action :set_room

  def show
  end

  private

  def set_room
    @room = Room.includes(:players).find(params[:id])
  end
end
