class HostsController < ApplicationController
    before_action :authenticate_user
    before_action :set_host, only: [:show, :edit, :update, :destroy, :completed]
  
    def index    
      if current_user.admin
        @users = User.where(admin: false)  
        #@hosts = Host.all.recent    
      else 
        @users = User.where(id: current_user.id)
       # @hosts = Host.all.status
      end
    end
  
    def show    
    end
  
    def new
      @host = Host.new
      @task = Task.new
    end
  
    def create 
      @host = Host.new(host_params)
      if @host.save
        flash[:notice] = "Successfully created Host."
        redirect_to @host
      else 
        flash[:notice] = "Host not created."
        render :new
      end
    end
  
    def edit
    end
  
    def update     
      if @host.update(host_params)
        flash[:notice] = "Successfully updated host."
        redirect_to @host
      else 
        flash[:notice] = "Un-Successfully updated host."
        render :edit
      end
    end
  
    def destroy     
      if @host.delete
           @tasks = Task.where(:host_id => @host.id)
           
           if @tasks.delete_all
            flash[:notice] = "Successfully deleted this Host !! All tasks for this Host were also deleted !!"
            redirect_to @host
           end
       else
           flash[:notice] = "This Host was not deleted !!"         
           redirect_to hosts_path
       end
    end 
  
    def completed
      @tasks = @host.tasks.completed
      render :"/tasks/completed"
    end 
  
    private
    def set_host
      @host = Host.find_by(id: params[:id])
    end 
  
    def host_params
      params.require(:host).permit(:name, :description, :status)
    end
  
  end