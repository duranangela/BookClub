class ReviewsController < ApplicationController

  def new
    binding.pry
    @review = Review.new
    @book = Book.find(params[:book_id])
    @user = User.find(params[:user_id])
  end

  def create
    @book = Book.find(params[:book_id])
    @user = User.find(params[:user_id])
    @review = @book.reviews.create(review_params)
    # binding.pry
    if @review.save
      redirect_to author_book_path(@book.author, @book)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment, :book_id, :user_id)
  end

end
