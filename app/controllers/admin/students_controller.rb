class Admin::StudentsController < Admin::BaseController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
  end

  def show
  end

 private

  def set_student
    @student = Student.find(params[:id])
  end

end