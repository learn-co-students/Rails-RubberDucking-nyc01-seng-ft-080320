class StudentsController < ApplicationController
  before_action :find_student, only: [:show, :edit, :update]
  before_action :new_student, only: [:new, :create ]
  def index
    @students = Student.all
  end
  
  def show
  end

  def new
    @duck = @student.ducks.build
  end

  def create
    @student.update(student_params)
    if @student.valid?
      redirect_to student_path(@student)
    else
      flash[:errors] = @student.errors.full_messages
      redirect_to new_student_path
    end
  end

  def update
    @student.update(student_params)
    if @student.valid?
      redirect_to student_path(@student)
    else
      flash[:errors] = @student.errors.full_messages
      redirect_to edit_student_path
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :mod)
  end

  def find_student
    @student = Student.find(params[:id])
  end

  def new_student
    @student = Student.new
  end
end
