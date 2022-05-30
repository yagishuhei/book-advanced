class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to request.referer
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def update
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
