class DucksController < ApplicationController

  def index
    @ducks = Duck.all
  end

  def show
    @duck = Duck.find(params[:id])
  end

  def new
    @duck = Duck.new
  end

  def create
    @duck = Duck.create(duck_params)
    #byebug
    if @duck.valid?
        redirect_to duck_path(@duck)
    else
        render :new
    end
  end

  def edit
    @duck = Duck.find(params[:id])
  end

  def update
    @duck = Duck.find(params[:id])
    if @duck.update(duck_params)
        redirect_to duck_path(@duck)
    else
        render :edit
    end
  end

  private
  
  def duck_params
    params.require(:duck).permit(:name, :description, :student_id)
  end
end
