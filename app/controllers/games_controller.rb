class GamesController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end

  def new 
    @game = Game.new
  end

  def create
    @game = Game.create
  end

  def show
  end
  
end
