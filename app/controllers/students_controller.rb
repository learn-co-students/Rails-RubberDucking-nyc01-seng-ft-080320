class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.create(student_params(:name, :mod))
    #byebug
    if @student.valid?
        redirect_to student_path(@student)
    else
        render :new
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

    def update
        @student = Student.find(params[:id])
        #byebug
        #raise params.inspect
        if @student.update(student_params(:name))
            redirect_to student_path(@student)
        else
            render :edit
        end
    end

    def destroy
        Student.find(params[:id]).destroy
        redirect_to students_path
    end

  private

  def student_params(*args)
    params.require(:student).permit(*args)
  end

end
