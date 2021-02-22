class CocktailsController < ApplicationController


def index
  @cocktails = Cocktail.all
end

def new
end

def show
  @cocktail = Cocktail.find(params[:id])
end

def create
end


end
