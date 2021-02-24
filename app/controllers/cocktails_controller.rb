class CocktailsController < ApplicationController
  before_action :set_cocktails, only: %i[show edit update destroy]
  def index
    @cocktails = Cocktail.all
  end
  def show
    @dose = Dose.new
    @review = Review.new
    # show
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to @cocktail
    else
      render :new
    end
  end

  def edit
    # edit
  end

  def update
    @cocktail.update(cocktail_params)
    redirect_to root_path
  end

  def destroy
    @cocktail.destroy
    redirect_to root_path
  end

  def search
    @cocktails = Cocktail.where("name LIKE '%#{params[:search]}%'")

    @total = Cocktail.count
    @request = params[:search]
  end

  private

  def set_cocktails
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :picture)
  end
end
