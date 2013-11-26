class CommentsController < ApplicationController
	before_filter :authenticate_user!
	before_filter :find_ticket
	def create 
		@comment = @ticket.comments.build(comment_params)
		if @comment.save
			flash[:notice] = "ticket has been commented"
			redirect_to [@ticket.project, @ticket]
		else
			flash[:error] = "could not comment"
			render template: "tickets/show"
		end
	end
#-------------------------private--------------------------#
private 
	def comment_params 
		prms = params.require(:comment).permit(:text)
		prms.merge(user: current_user)
	end
	def find_ticket
		@ticket = Ticket.find(params[:ticket_id])
	end
end