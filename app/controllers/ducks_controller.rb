class DucksController < ApplicationController

  def index
    @ducks = Duck.all
  end

  def show
    @duck = Duck.find(params[:id])
  end

  def edit
    @duck = Duck.find(params[:id])
  end

  def update
    @duck = Duck.find(params[:id])
    @duck.update(duck_params)

    if @duck.valid?  
      redirect_to duck_path(@duck)
    else
      render :edit
    end
  end

  def new
    @duck = Duck.new(params[:id])
  end

  def create
    @duck = Duck.new(duck_params)

    if @duck.valid?
      @duck.save(duck_params)
      redirect_to ducks_path(@duck)
    else
      render :edit
    end
  end

private

def duck_params
  params.require(:duck).permit(:name, :description, :student_id)
end

end
