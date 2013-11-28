class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :find_states
  def authorize_admin! 
  	authenticate_user!
  	unless current_user.admin?
  		flash[:alert] = "You must be an admin to do this action"
  		redirect_to(root_path)
  	end
  end
  def find_states
    @states = State.all
  end
  def find_project
    #this is referring to the foreign key that in the database
    @project = Project.for(current_user).find(params[:project_id]) 
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "you messed up!"
      redirect_to root_path   
   end
end
