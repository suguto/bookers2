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
   if @book.save
     flash[:notice]="You have created book successfully."
      redirect_to book_path(@book[:id])
   else
     render"index"
     
  end
  
  def update
    book=Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(list)
  end

  def destroy
    @book=Book.find(params[:id])
    @book.destroy(book_params)
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
