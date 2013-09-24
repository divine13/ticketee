class TicketsController < ApplicationController
	before_filter :find_project
	before_filter :find_ticket, only: [:show, :edit, :update, :destroy]

	def new
	   @ticket = @project.tickets.build()
	end

	def create 
		@ticket = @project.tickets.build(ticket_params)
		if(@ticket.save)
			flash[:notice] = "ticket has been created"
			redirect_to([@project, @ticket])
		else
			render 'new'
		end
	end

	def show 
       #here we just put the find_ticket associated with a proje
	end
	def edit
	end
	def update
		if @ticket.update_attributes(ticket_params)
		flash[:notice] = "your ticket has been updated "
		redirect_to([@project, @ticket])
	else
		flash[:alert] = "could not update attributes because"
		render 'edit'
		end
	end
	def destroy
		@ticket.destroy
		flash[:alert] = "ticket deleted"
		redirect_to @project
	end
private
	 def find_project
	 	@project = Project.find(params[:project_id]) #this is referring to the foreign key that in the database
	 end

	 def ticket_params
	 	params.require(:ticket).permit(:title, :description, :project_id)
	 end

	 def find_ticket
		@ticket = @project.tickets.find(params[:id])
	end
end
