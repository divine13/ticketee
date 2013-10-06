class RegistrationsController < Devise::RegistrationsController
#-------------private methods---------------
#private
 def after_inactive_signup_path_for(resources)
 	confirm_user_path
 end
end