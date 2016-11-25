class Admin::StudentsController < Admin::BaseController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
  end

  def show
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to admin_student_path(@student), notice: 'Ученик создан.'
    else
      render :new 
    end   
  end

 private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:email, :first_name, :last_name)
  end

end