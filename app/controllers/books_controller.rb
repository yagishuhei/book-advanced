class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    #データ保存にストロングパラメータが必要
    @book = Book.new(book_params)
    ##アソシエーションを組んでいるのでuser_idが必要
    @book.user_id = current_user.id
    @book.save
    redirect_to request.referer
  end


  def show
    @book = Book.find(params[:id])
    @book_comment = BookComment.new
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
