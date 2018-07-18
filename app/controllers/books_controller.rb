class BooksController < ApplicationController

  def index
    @books = Book.alpha_order
  end

  def show
    @book = Book.find(params[:id])
    @reviews = @book.reviews
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

  def edit
    @book = Book.find(params[:id])
    @author = Author.find(params[:author_id])
  end

  def update
    @author = Author.find(params[:author_id])
    @book = @author.books.find(params[:id])
    @book.update(book_params)
    if @book.save
      redirect_to author_book_path(@author, @book)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy

    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :year, :image, :author_id)
  end

end
