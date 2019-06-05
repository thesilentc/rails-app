class HatsController < ApplicationController
    before_action :authenticate_user, only: [:create, :index, :destroy, :complete, :edit, :update]
    before_action :set_project, except: [:index]
    before_action :set_task, only: [:destroy, :complete, :edit, :update]
  
    def create  
      @hat = @host.hats.new(hat_params)
      @hat.user_id = current_user.id
      
      if @hat.save
        flash[:notice] = "Successfully created hat."
        redirect_to @host
      else 
        flash[:notice] = "Ooopss ...Task was not created.Check if this hat already exists or content can not be blank"
        redirect_to @host
      end
    end
  
    def index    
      @user = User.find_by(id: params[:user_id])    
      render :index
    end 
  
    def destroy  
      if @hat.delete 
        flash[:notice] = "Task was deleted successfully !"
      else 
        flash[:notice] = "Task was not deleted !"
      end 
      redirect_to @host
    end
  
    def complete     
      if @hat.update_attribute(:completed_at, Time.now)      
        flash[:notice] = "Congrats ! Task was completed successfully !"
      else
        flash[:notice] = "Ooopps there was some error !"
      end 
      redirect_to @host
    end 
  
    def edit 
    end 
  
    def update 
      if @hat.update(hat_params)
        flash[:notice] = "Successfully updated hat."
        redirect_to @host
      else 
        flash[:notice] = "Un-Successfully updated hat."
        render :edit
      end
    end 
   
    private
    
    def set_task 
      @hat = @host.hats.find_by(id: params[:id])
    end 
  
    def set_project
      @host = Project.find_by(id: params[:project_id])
    end 
  
    def hat_params
      params.require(:hat).permit(:content, :project_id => @host.id)
    end
  
  end