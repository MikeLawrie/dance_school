class Admin::TeachersController < Admin::BaseController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

  def index
    @teachers = Teacher.all
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      redirect_to admin_teacher_path(@teacher), notice: 'Преподаватель создан.' 
    else
      render :new 
    end   
  end

  def show
  end

  def edit
  end

  def update
     if @teacher.update(teacher_params)
      redirect_to admin_teacher_path(@teacher), notice: 'Преподаватель изменен.' 
    else
       render :edit 
    end
  end

  def destroy
    @teacher.destroy
    redirect_to admin_teachers_path, notice: 'Преподаватель удален.'
  end

  private

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(:name, :photo)
  end

end
