class Admin::UsersController < Admin::BaseController
	before_filter :find_user, only: [:show, :edit, :update, :destroy] #CRUD
  def index
  	@users = User.all(order: :email)
  end
  def show 
    #before_filter
  end
  def new 
  	@user = User.new
  end
  def create
	  @user = User.new(user_params)
	  set_admin
	  if @user.save
	  flash[:notice] = "users has been created "
	  redirect_to admin_users_path
 else 
	flash[:alert] = "users could not be created "
	render 'new' #if it does not work try adding action: 'new' 
	end
end
	def edit 
		#only need to find user here but imoved to before_filter 0_o!
	end
	def update 
		#the find user method is called here thats were the @user method comes from
		if user_params[:password].blank?
			user_params.delete(:password) #not sure if this is going to work %DGB*&
		end
		set_admin
		if @user.update_attributes(user_params)
			flash[:notice] = "User has been updated"
			redirect_to admin_user_path
		else
			flash[:alert] = "could not update user"
			render :edit
	end 
  end
  def destroy
  	if @user == current_user # bullet proof .curl?
  		flash[:alert] = "God wants you to live.you can not kill your self.but you can ask the ruthless admin to kill you "
  	else
  	@user.destroy
  	flash[:notice] = "user has been eliminated"
  	redirect_to admin_users_path
  end
end
#--------------------------private methods--------------------------  
private
  def user_params
  	params.require(:user).permit(:email, :password, :password_confirmation)
  end
  def find_user
  	@user = User.find(params[:id])
  end
  def set_admin
  	 @user.admin = user_params[:admin] = "1" #DBG change user to user_params
  end
  # def admin_attr
  #     uprms = params.require(:user).permit(:email, :password, :password_confirmation)
  # 	aprms = params.require(:user).permit(:admin)
  #     @user.admin = params([uprms][aprms] == "1")
  # end
end
