class Admin::UsersController < Admin::BaseController
  def index
  	@users = User.all(order: :email)
  end
  def new 
  	@user = User.new
  end
  def create
	  @user = User.new(user_params)
	  @user.admin = params([:user][:admin] == "1")
	  if @user.save
	  flash[:notice] = "users has been created "
	  redirect_to admin_user_path
 else 
	flash[:alert] = "users could not be created "
	render 'new'
	end
  end
#----------------------------------------------------------------------------  
 private
  def user_params
  	params.require(:user).permit(:email, :password, :password_confirmation)
  end
  # def admin_attr
  # 	params.require(:user).permit(:admin)
  # end
end
