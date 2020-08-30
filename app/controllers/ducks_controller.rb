class DucksController < ApplicationController
  before_action :duck_instance, only: [:show, :edit, :update, :destroy]

  def index
    @ducks = Duck.all
  end

  def show 
  end 

  def new
    @duck = Duck.new
  end

  def create
    @duck = Duck.create(duck_params)
    if @duck.valid?
      redirect_to duck_path(@duck)
    else
      flash[:errors] = @duck.errors.full_messages
      redirect_to new_duck_path
    end
  end

  def edit 
  end

  def update
    if @duck.update(duck_params)
      redirect_to duck_path(@duck)
    else
      flash[:errors] = @duck.errors.full_messages
      redirect_to edit_duck_path(@duck)
    end 
  end

  def destroy
    @duck.destroy
    redirect_to duck_index_path
  end

  private

  def duck_params
    params.require(:duck).permit(:name, :description, :student_id)
  end

  def duck_instance
    @duck = Duck.find(params[:id])
  end

end
