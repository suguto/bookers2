class UsersController < ApplicationController

  before_action :corrent_user,only:[:edit]


  def edit
    @user=User.find(params[:id])
  end

  def index
    @users=User.all
    @book=Book.new
    @user=current_user
  end

  def show
    @user=User.find(params[:id])
    @book=Book.new
    @books=@user.books
  end


  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user)
    else
      render"show"
    end

  end

  private

  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end

  def corrent_user
    redirect_to user_path(current_user) unless current_user
  end

end
