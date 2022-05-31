class BookCommentsController < ApplicationController
  def create
    #ルーティングをネストしているためIDは:book_idになる
    book = Book.find(params[:book_id])
    #book_comment = BookComment.new(book_comment_params)
    #book_comment.user.id = current_user.id
    #と同じ意味
    book_comment = current_user.book_comments.new(book_comment_params)
    book_comment.book_id = book.id
    book_comment.save
    redirect_to book_path(book)
  end

  def destroy
    BookComment.find(params[:id]).destroy
    #ルーティングネストしているため:book_id
    redirect_to book_path(params[:book_id])
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:book_id, :comment)
  end
end
