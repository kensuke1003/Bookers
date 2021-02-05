class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end
  
  def create
    book = Book.new(book_params)
    if book.save
      flash[:notice] = 'Book was successfully created.'  
      flash[:alert] = "名前を入力してください"
        redirect_to book_path(book.id)
      else
          render :index
    end
  end
  
  def save
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
