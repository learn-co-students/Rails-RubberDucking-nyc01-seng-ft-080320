class DucksController < ApplicationController
  before_action :find_duck, only: [:show, :edit, :update, :destroy]
  before_action :new_duck, only: [:new,:create]
  def index
    @ducks = Duck.all
  end

  def show

  end

  def new
    
  end

  def destroy
    @duck.destroy
    redirect_to ducks_path
  end

  def update
      @duck.update(duck_params)
    if @duck.valid?
      redirect_to duck_path(@duck)
    else
      flash[:errors]= @duck.errors.full_messages
      redirect_to edit_duck_path(@duck)
    end
  end


  def create

    @duck.update(duck_params)
    if @duck.valid?
      redirect_to duck_path(@duck)
    else
      byebug
      flash[:errors]= @duck.errors
      redirect_to new_duck_path
    end

  end

  private

  def duck_params
    params.require(:duck).permit(:name, :description, :student_id)
  end

  def find_duck
    @duck = Duck.find(params[:id])
  end

  def new_duck
    @duck = Duck.new
  end
end
