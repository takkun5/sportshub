class SearchController < ApplicationController
  def show
    search_word = params[:search_word]
    @training_contents = TrainingContent.where("purpose like ?","%"+ search_word + "%")
  end
end
