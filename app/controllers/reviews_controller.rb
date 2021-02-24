# frozen_string_literal: true

# :nodoc:
class ReviewsController < ApplicationController
  before_action :set_reviews, only: [:destroy]

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = Review.new
  end

  def create
    @review = Review.new(reviews_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review.cocktail = @cocktail
    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to cocktail_path(@review.cocktail)
  end

  private

  def set_reviews
    @review = Review.find(params[:id])
  end

  def reviews_params
    params.require(:review).permit(:rating, :content)
  end
end
