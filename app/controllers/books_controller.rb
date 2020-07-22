class BooksController < ApplicationController
  
  def edit
    @book = Book.find(params[:id])
  end

def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "Book was successfully updated."
    else
      render :edit
    end
end

  def create
    @book = Book.new(book_params)
  	@book.user_id =current_user.id
  	if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book)
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
end
