class ProjectsController < ApplicationController

	def index #CRUD ALWAYS FOLLOWS CRUD STEPS Dry code!
		@project = Project.all
	end
	def new 
		@project = Project.new
	end
	def create 
		@project = Project.new(project_params)
		if @project.save
		redirect_to @project
		flash[:notice] = "project hase been created"
	   else
	   	render 'new'
	   	end
	end

    def show
    	@project = find_project
    end

    def edit 
    	@project = find_project
    end

    def update
    	@project = find_project
    	if(@project.update_attributes(project_params))
    	flash[:notice] = "project succesfully updated"
    	redirect_to @project
    else
    	flash[:alert] = "project has not been update because:"
    	render 'edit'
    end
    end

    def destroy
    	@project = find_project
    	@project.destroy
    	flash[:alert] = "#{@project.name} project has been deleted"
    	redirect_to projects_path
    end


    #rails 4 requirements for a better
	 def project_params
      params.require(:project).permit(:name)
    end
    def find_project
    	Project.find(params[:id])
    end
end
