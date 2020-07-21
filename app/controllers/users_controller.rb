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
    @book = Book.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.all
  end

  def edit
  @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit( :name, :profile_image, :introduction)
  end
end
