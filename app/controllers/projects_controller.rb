class ProjectsController < ApplicationController

    before_filter :authorize_admin!, except: [:index, :show]

     #heavily commented just to make sure i am on right ._path
    before_filter :authenticate_user!, only: [:index, :show]
    before_filter :find_project, only: [:show, :edit, :update, :destroy] #DRY! 100%

	def index    #CRUD. ALWAYS FOLLOW CRUD STEPS. DRY code!, nice...
		@project = Project.for(current_user).all
	end
	def new    #this method passes the newly created object to the create method 
		@project = Project.new #it carries the params to the create  method
	end

	def create        #it process those newly created objects 
		@project = Project.new(project_params) #it injects those objects into the DB
		if @project.save #true or false . true! it must or it will blow 
        flash[:notice] = "project has been created"
		redirect_to @project
	   else
	   	render 'new' #it blows to this  
	   	end
	end

    def show
    	#the before_filter in inserts  @project = Project.find(params[:id]) here
    	#before this method is executed
    end

    def edit 

    end

    def update
    if(@project.update_attributes(project_params))
    	flash[:notice] = "project has been updated"
    	redirect_to @project
    else
    	flash[:alert] = "project has not been update because:"
    	render 'edit'
    end
    end

    def destroy
    	@project.destroy
    	flash[:alert] = "#{@project.name} project has been deleted"
    	redirect_to projects_path
    end
#---------------------private methods--------------------------
private
    #rails 4 requirements for better security
     def project_params
      params.require(:project).permit(:name)
    end
    def find_project #the magic happens here
       @project =  Project.for(current_user).find(params[:id])
    rescue ActiveRecord::RecordNotFound
    	flash[:alert] = "Sorry..., The page you are looking for is not available"
    	redirect_to root_path
    end
    end

