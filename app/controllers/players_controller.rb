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
  
  def edit
   @player = current_user
 end
 
  def update
   @player = current_user
   if @Player.update(player_profile)
      flash[:success]= "プロフィールを変更しました。" 
      redirect_to player_path(@player)
   else
     render 'edit'
   end
  end   
  
  
  private
  
  def player_params
    params.require(:player).permit(:name, :email, :age, :profile, :sports_type, :place,  :password, 
                                   :password_confirmation)
  end
  
  def player_profile
    params.require(:player).permit(:name, :email, :age,  :profile, :sports_type, :place, :password)
  end
  
  
  def set_player
    @player = Player.find(params[:id])
  end
  
  
end
