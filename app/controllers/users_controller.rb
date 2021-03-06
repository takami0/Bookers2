class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :index, :show]

  def show
    @user = User.find(params[:id])
    @book_new = Book.new

  end

  def index
    @user = current_user
    @users = User.all
    @book_new = Book.new
  end

  def edit
    @user_self = current_user
    @user = User.find(params[:id])
    if @user != @user_self
      redirect_to user_path(@user_self.id)
    end
  end

  def update
    @user_self = current_user
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction )
  end
end
