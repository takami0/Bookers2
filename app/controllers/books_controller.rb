class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:edit]

  def new
    @book_new = Book.new
  end

  def create
    @book_new = Book.new(book_params)
    @book_new.user_id = current_user.id
    @user_self = current_user
    if @book_new.save
      redirect_to book_path(@book_new.id), notice: "You have created book successfully."
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @user = current_user
    @book_new = Book.new
    @books = Book.all
  end

  def show
    @user = current_user
    @book_new = Book.new
    @book = Book.find(params[:id])
  end

  def edit
    @user_self = current_user
    @book = Book.find(params[:id])
  end

  def update
    @user_self = current_user
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: "You have updated book successfully."
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id )
  end

end

