class UsersController < ApplicationController

  before_action :correct_user, only: [:edit, :update]

  def top
    @book = Book.new
  end

  def about
    render :about
  end

	def create
    	@user = User.new(user_params)
    	@user.user_id = current_user.id
    	if @user.save
    	redirect_to user_path
    else
      render :show
	end
end

  def index
  	@user = current_user
    @book = Book.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books.all
  end

  def edit
  @user = User.find(params[:id])
  @book = Book.new
  end

  def update
    @book =Book.new
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


  def correct_user
    user = User.find(params[:id])
    if current_user != user
      render :edit
    end
  end
end
