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
        duck = Duck.find(params[:id])
        duck.update(duck_params)
        if duck.valid?
            redirect_to duck_path(duck)
        else
            redirect_to edit_duck_path(duck)
        end
    end

    def new
        @duck = Duck.new
    end
    
    def destroy
        duck = Duck.find(params[:id])
        duck.destroy
        redirect_to ducks_path
    end

    def create
        duck = Duck.new(duck_params)
        if duck.valid?
            duck.save
            Studentduck.create(student_id: Student.all.sample.id, duck_id: duck.id)
            redirect_to duck_path(duck)
        else
            redirect_to new_duck_path(duck)
        end
    end
    
    
    
    
    
    private

    def duck_params
        params.require(:duck).permit(:name, :description)
        
    end
    
end
