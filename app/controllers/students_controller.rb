class StudentsController < ApplicationController

  before_action :find_student, only: [:show, :edit, :update]

  def index
    @students = Student.all
  end

  def show
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params(:name, :mod))
    if @student.valid?
      @student.save
      redirect_to student_path(@student)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @student.update(student_params(:name))
      redirect_to student_path(@student)
    else
      render :edit
    end
  end

  private

  def student_params(*args)
    params.require(:student).permit(*args)
  end

  def find_student
    @student = Student.find(params[:id])
  end

end
