class Ability 
	include CanCan::Ability

	def initialize(user)
		user.permissions.each do |user|
			can user.action.to_sym,
			user.thing_type.constantize do |thing|
				thing.nil? ||
				user.thing_id.nil? ||
				user.thing_id == thing.id
			end
		end
	end
end
