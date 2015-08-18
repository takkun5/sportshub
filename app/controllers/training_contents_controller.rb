class TrainingContentsController < ApplicationController
    before_action :logged_in_user, only: [:new, :create, :destroy]
    before_action :set_training_content, only: [:show]
   
   def show
   end  
   
   def new
     @training_content = TrainingContent.new       
   end
  
    def create
        @training_content = current_user.training_contents.build(training_content_params)
        if @training_content.save
            flash[:success] = "プランを作成しました！"
            redirect_to root_url
        else
            render 'welcomes/home'
        end    
    end
    
    def destroy
    @training_content = current_user.training_contents.find_by(id: params[:id])
    return redirect_to root_url if @training_content.nil?
    @training_content.destroy
    flash[:success] = "プランを消去しました。"
    redirect_to request.referrer || root_url
  end

    
    private
    def training_content_params
        params.require(:training_content).permit(:name, :content,  
                        :sports_type, :image)
        
    end
    
    def set_training_content
    @training_content = TrainingContent.find(params[:id])
  end
end
