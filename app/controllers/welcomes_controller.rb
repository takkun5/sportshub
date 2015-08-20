class WelcomesController < ApplicationController
  before_action :logged_in_user, except: [:find]
  
  
  def home
    
    #トップ画面にプランを表示する
     @training_contents = TrainingContent.all
     
     
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
  
  def find
    if logged_in?
      
      if request.post? then
        fstr = params[:fstr]
        @training_contents = TrainingContent.where("name like ?","%"+ fstr + "%")
        # @training_contents = TrainingContent.where("content like ?","%"+ fstr + "%")
        # @training_contents = TrainingContent.where("sports_type like ?","%"+ fstr + "%")
        # @training_contents = TrainingContent.where("purpose like ?","%"+ fstr + "%")
      end
    end
  end  
  
  
  private
  def set_training_content
    @training_content = TrainingContent.find(params[:id])
  end
  
end
