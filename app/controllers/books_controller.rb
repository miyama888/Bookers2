class BooksController < ApplicationController
  
before_action :correct_user, only: [:edit, :update]

  def edit
    @book = Book.find(params[:id])
  end

def update
    
    @books =Book.all
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: "Book was successfully updated."
    else
      render :edit
    end
end

  def create
    @book = Book.new(book_params)
  	@book.user_id =current_user.id
  	if @book.save
      flash[:notice] = "You have creatad book successfully."
      redirect_to book_path(@book)
    else
      redirect_to books_path(@book)
    end
  end

  def index
    @book = Book.new
    @user = current_user
  	@books =Book.all

  end

  def show
  	@book = Book.find(params[:id])
    @user = @book.user
    @books = Book.all
  end

def destroy
  book = Book.find(params[:id])
  book.destroy
  redirect_to books_path(book), notice: "Book was successfully destroyed."
end

  private

  def book_params
    params.require(:book).permit(:title, :body )
  end


  def correct_user
    book = Book.find(params[:id])
    if current_user != book.user
      redirect_to books_path
    end
  end
end
