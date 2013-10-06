class Ability 
	include CanCan::Ability

	def initialize(user)
		user.permisions.each do |user|
			can user.action.to_sym,
			user.thing_type.constatize do |thing|
				thing.nil? ||
				user.thing_id.nil? ||
				user.thing_id = thimg.thing_id
			end
		end
	end
end
