class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    @author = Author.find(params[:author_id])
  end

  def create
    @author = Author.find(params[:author_id])
    @book = @author.books.create(book_params)
    if @book.save
      redirect_to author_book_path(@author, @book)
    else
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :year, :image, :author_id)
  end

end
