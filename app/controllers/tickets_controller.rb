class TicketsController < ApplicationController
	before_filter :authenticate_user!
	before_filter :find_project
	before_filter :find_ticket, only: [:show, :edit, :update, :destroy]
	before_filter :authorize_create!, only: [:new, :create]
	before_filter :authorize_update, only: [:edit, :update,]

	def new
	   @ticket = @project.tickets.build
	   @ticket.assets.build
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
       @comment = @ticket.comments.build
       @states = State.all
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
#---------------------------------private methods----------------------------------
private
	 def ticket_params
	 	#params.require(:assets).permit(:all)
	 	prms = params.require(:ticket).permit! #permit(:title, :description, :project_id) 
	 	prms.merge!(user: current_user)
	 end

	 def find_ticket
		@ticket = @project.tickets.find(params[:id])
		#@ticket = para
	end
	#the @project var comes from the find_project method
	def authorize_create!
		if !current_user.admin? && cannot?("create tickets".to_sym, @project)
			flash[:alert] = "you cannot create tickets for this project ask admin for help"
			redirect_to @project
		end
	end
	def authorize_update 
		if !current_user.admin? && cannot?(:"edit tickets".to_sym, @project)
			flash[:alert] = "you cannot update this project tickets"
			redirect_to @project
		end
	end
	def authorize_delete
		if !current_user.admin && cannot?(:"delete tickets".to_sym, @project)
			flash[:alert] = "you cannot delete this project tickets"
			reidrect_to @project
 	end
  end
end
