class WelcomesController < ApplicationController
  def home
    
    # トレーナーだったら
    # if current_user.instance_of? Trainer
    # if current_user.instace_of? Player
   
    # if params[:type] == "Player"
    if current_user.instance_of? Player
      @player = current_user
      #@training_content = trainer.training_contents
    end  
    
    if current_user.instance_of? Trainer
      @training_content = current_user.training_contents.build if logged_in?
    end
  
  end
end
