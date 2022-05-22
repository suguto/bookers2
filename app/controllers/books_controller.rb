class BooksController < ApplicationController
  before_action :correct_book,only: [:edit]

  def new
    @book=Book.new
  end

  def index
    @books=Book.all
    @book=Book.new
    @user=current_user
  end

  def show
    @books=Book.find(params[:id])
    @book=Book.new
    #@user=User.find(params[:id])
    @user = @books.user
  end

  def edit
    @book=Book.find(params[:id])
  end

  def create
   @book=Book.new(book_params)
   @book.user_id = current_user.id
   @books=Book.all
   @user=current_user
   if @book.save
     flash[:notice]="You have created book successfully."
      redirect_to book_path(@book)
   else
     render"index"
   end

  end

  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to book_path(@book)
    else
      render:"edit"
    end

  end

  def destroy
    @book=Book.find(params[:id])
    if @book.destroy
      flash[:notice]="You have destroyed user successfully."
      redirect_to books_path
    else
      render"show"
    end

  end

  private

  def book_params
    params.require(:book).permit(:title,:body)
  end

  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end

  def correct_book
    @book=Book.find(params[:id])
    redirect_to books_path unless @book.user == current_user
  end

end
