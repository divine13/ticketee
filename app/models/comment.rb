class Comment < ActiveRecord::Base
	after_create :set_ticket_state

    belongs_to :project 
	belongs_to :ticket
    belongs_to :user
	belongs_to :state 
	validates(:text, presence: true)

	delegate :project, to: :ticket 

private 

	def set_ticket_state
		self.ticket.state_id = self.state_id 
		self.ticket.save!
	end
end
