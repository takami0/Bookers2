class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = Book.new
    if @book.save
      redirect_to controller: :books, action: :show
    end
  end

  def index
    # @user = User.find(params[:id])
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end


  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction )
  end
end
