class HelpsController < ApplicationController
  def home
    @training_contents = TrainingContent.all
  end
end
