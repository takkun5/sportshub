class TrainersController < ApplicationController
  before_action :set_trainer,
                only: [:show, :edit, :update, :destroy]
  
  def show
    @trainer = Trainer.find(params[:id])  
    @training_contents = @trainer.training_contents
  end
  
  def new
    @trainer = Trainer.new
  end
  
  def create
    @trainer = Trainer.new(trainer_params)
    if @trainer.save
       flash[:success] = "Welcome to the SportsHub!"
       redirect_to @trainer
    else
      render 'new'
    end
  end
  
  def edit
   @trainer = current_user
 end
 
  def update
   @trainer = current_user
   if @trainer.update(trainer_profile)
      flash[:success]= "プロフィールを変更しました。" 
      redirect_to trainer_path(@trainer)
   else
     render 'edit'
   end
  end   
  
  private
  
  def trainer_params
    params.require(:trainer).permit(:name, :email, :age, :profile, :speciality, :sports_type, :place,  :password, 
                                   :password_confirmation)
  end
  
  def trainer_profile
    params.require(:trainer).permit(:name, :email, :age,  :profile, :sports_type, :place, :password)
  end
  
  def set_trainer
     @trainer = Trainer.find(params[:id])  
  end  
  
end
