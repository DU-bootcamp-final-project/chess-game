class GamesController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end

  def new 
    @game = Game.new
  end

  def update
  end

  def show
  end
  
end
