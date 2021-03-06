# frozen_string_literal: true

# :nodoc:
class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(doses_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.ingredient_id = nil
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def set_doses
    @dose = Dose.find(params[:id])
  end

  def doses_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
