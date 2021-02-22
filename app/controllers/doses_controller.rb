class DosesController < ApplicationController



def index
  @dose = Dose.all
end

def new
  @dose = Dose.all
end

def show
  @dose = Doses.all
end

def create
end


end
