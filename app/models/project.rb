class Project < ActiveRecord::Base

	has_many(:tickets)

	validates(:name, presence: true)

	has_many :permissions, as: :thing 

	#this method finds users projects with the action = view 
	scope :readable_by, lambda { |user| joins(:permissions).where(permissions:
	 { action: "view", user_id: user.id}) }
end
