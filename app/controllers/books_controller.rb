class BooksController < ApplicationController
  def new
    @book=Book.new
  end

  def index
    @books=Book.all
    @book=Book.new
    @user=current_user
  end

  def show
    @book=Boook.find(params[:id])
  end

  def create
   @book=Book.new(book_params)
   @book.save
   redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title,:body)
  end

  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end

end
