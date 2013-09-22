class ProjectsController < ApplicationController
	def index 
		@project = Project.all
	end
	def new 
		@project = Project.new
	end
	def create 
		@project = Project.new(project_params)
		@project.save
		redirect_to @project
		flash[:notice] = "project have been created"
	end
	 def project_params
      params.require(:project).permit(:name)
    end
    def show
    	@project = Project.find(params[:id])
    end
end
