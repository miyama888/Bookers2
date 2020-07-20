class UsersController < ApplicationController
  def top
  end


	def create
    	@user = User.new(user_params)
    	@user.user_id = current_user.id
    	@user.save
    	redirect_to user_path  
	end

  def index
  	@user = current_user
  end

  def show
  end

  def edit
  @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit( :image)
  end
end
