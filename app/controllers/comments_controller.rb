class CommentsController < ApplicationController
	before_filter :authenticate_user!
	before_filter :find_ticket
	before_filter :find_pro

	def create
		@comment = @ticket.comments.build(comment_params)
	    if cannot?(:"change states", @ticket.project)
		    params[:comment].delete(:state_id)
	    end
		if @comment.save
			flash[:notice] = "ticket has been commented"
			redirect_to [@ticket.project, @ticket]
		else
			@states = State.all
			flash[:error] = "could not comment"
			render 'tickets/show'
		end
	end
#-------------------------private--------------------------#
private 
	def comment_params 
		prms = params.require(:comment).permit(:text, :state_id)
		prms.merge(user: current_user)
	end
	def find_ticket
		@ticket = Ticket.find(params[:ticket_id])
	end
	def find_pro
		@project = Project.find(params[:project_id])
	end
end
