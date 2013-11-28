class Admin::StatesController < Admin::BaseController
  def index
  	@states = State.all
  end

  def new
  	@state = State.new
  end

  def create
  	@state = State.new(states_params)
  	if @state.save
  		flash[:notice] = "state has been successfully created"
  		redirect_to admin_states_path
  	else
  		flash[:alert] = "state could not be created"
  		render action: 'new'
  	end
  end

  def make_default
  	@state = State.find(params[:id])
  	@state.default!

  	flash[:notice] = "#{@state.name} is now the default state"
  	redirect_to admin_states_path
  end
private 

  def states_params
  	params.require(:state).permit(:name)
  end
end
