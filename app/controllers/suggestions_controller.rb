class SuggestionsController < ApplicationController

  def index
    @suggestions = Suggestion.all
  end

  def new
    @suggestion = Suggestion.new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @suggestion = @user.suggestions.create(suggestion_params)
    if @suggestion.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
    suggestion = Suggestion.find(params[:id])
    suggestion.destroy

    redirect_to suggestions_path
  end

  private

  def suggestion_params
    params.require(:suggestion).permit(:author, :title, :rating, :comment, :user_id)
  end
end
