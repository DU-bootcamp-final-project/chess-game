class GamesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @games = Game.all
  end

  def new 
    @game = Game.new
  end

  def create
    @game = Game.create(game_params)
  end

  def update
    @game = Game.find(params[:id])
    if current_user 
      @game.update(user_id_white: current_user.id)     
    redirect_to game_path
    end
   end

  def show
    begin 
      @game = Game.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @game = Game.new
      @game.user_id = current_user.id
      @game.save
    end
  end
  
  private

  def game_params
    params.require(:game).permit(:name, :user_id_black)
  end
  
  def available
    if white_player_id
      return true
    else
      return false
    end
  end
  
end
