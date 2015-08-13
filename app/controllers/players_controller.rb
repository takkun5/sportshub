class PlayersController < ApplicationController
  before_action :set_player,
                only: [:show, :edit, :update, :destroy]
  
  def show
    @player = Player.find(params[:id])
  end
  
  def new
    @player = Player.new
  end
  
  def create
    @player = Player.new(player_params)
    if @player.save
       flash[:success] = "Welcome to the SportsHub!"
       redirect_to @player
    else
      render 'new'
    end
  end
  
  private
  
  def player_params
    params.require(:player).permit(:name, :email, :age, :profile, :sports_type, :place,  :password, 
                                   :password_confirmation)
  end
  
  def set_player
    @player = Player.find(params[:id])
  end
  
  
end
