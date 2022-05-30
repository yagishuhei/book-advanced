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
  end

  def edit
  end

  def destroy
  end

  def update
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
