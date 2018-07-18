class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @book = Book.find(params[:book_id])
  end

  def create
    @book = Book.find(params[:book_id])
    @review = @book.reviews.create(review_params)
    if @review.save
      redirect_to author_book_path(@book.author, @book)
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
    @book = Book.find(params[:book_id])
  end

  def update
    @book = Book.find(params[:book_id])
    @review = @book.reviews.find(params[:id])
    @review.update(review_params)
    if @review.save
      redirect_to author_book_path(@book.author, @book)
    else
      render :edit
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment, :book_id, :user_id)
  end

end
