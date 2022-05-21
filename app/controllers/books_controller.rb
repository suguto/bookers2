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
      redirect_to book_path(book)
    else
      render:"show"
    end

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
