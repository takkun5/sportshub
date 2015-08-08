class TrainersController < ApplicationController
  def show
    @trainer = Trainer.find(params[:id])  
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
  
  private
  
  def trainer_params
    params.require(:trainer).permit(:name, :email, :age, :profile, :speciality, :sports_type, :place,  :password, 
                                   :password_confirmation)
  end
end
