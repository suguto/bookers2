class UsersController < ApplicationController


  def edit
    @user=User.find(params[:id])
  end

  def index
    @users=User.all
    @user=User.new
  end

  def show
    @user=User.find(params[:id])
    @books=@user.books
    
  end

  def create
    @user=User.new(user_params)
    @user.user_id=current_user
    if @user.save
      flash[:notice]="You have created book successfully."
      redirect_to book_path
    else
      render"index"
    end
  end

  def update
    user=User.find(params[:id])
    if user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(user)
    else
      render"show"
      
  end

  private

  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end

end
