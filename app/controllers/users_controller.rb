class UsersController < ApplicationController

  before_action :correct_user, only: [:edit, :update]

  def top
    @book = Book.new
  end

  def about
    render :about
  end


  def index
  	@user = current_user
    @book = Book.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit
  @user = User.find(params[:id])

  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path, notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  def followings
      @user  = User.find(params[:id])
      @users = @user.followings
      render 'follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'follower'
  end


  private
  def user_params
    params.require(:user).permit( :name, :profile_image, :introduction)
  end


  def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to user_path(current_user)
    end
  end
end
