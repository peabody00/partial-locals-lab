class StudentsController < ApplicationController
  before_action :set_student, only: [:edit, :show]

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render 'new'
    end
  end

  def index
    @students = Student.search(:name)
  end

  def edit
  end

  def show
  end

  private

  def student_params
    params.require(:student).permit(:name, :birthday, :hometown)
  end

  def set_student
    @student = Student.find(params[:id])
  end 
end