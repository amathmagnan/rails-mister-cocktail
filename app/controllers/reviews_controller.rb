class ReviewsController < ApplicationController



def index
  @cocktails = Cocktail.all
end

def new
end

def show
  @cocktails = Cocktail.all
end

def create
end



end
