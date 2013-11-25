class Admin::PermissionsController < Admin::BaseController
	before_filter :find_user

	def index
		@ability = Ability.new(@user)
		@projects = Project.all
	end
	def update 
		@user.permissions.clear
		update_params.each do |id, permissions|
			project = Project.find(id)
			permissions.each do |permission, checked|
				Permission.create!(user: @user, thing: project, action: permission)
			end
		end
		flash[:notice] = "user attributes has been updated "
		redirect_to admin_user_permissions_path
	end
#------------------private methods---------------------
private
	def find_user
		@user = User.find(params[:user_id])
	end
	def update_params
		params.require(:permissions)
	end
end

