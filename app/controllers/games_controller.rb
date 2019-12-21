class GamesController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end

  def new 
    @game = Game.new
  end

  def update
    @game = Game.update
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
  
end
