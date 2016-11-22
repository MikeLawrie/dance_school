class Admin::LessonsController < Admin::BaseController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]

  def index
    @lessons = Lesson.all
  end

  def new
    @lesson = Lesson.new
    @lesson.start_time = Time.now.strftime('%F %R')  
  end

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      redirect_to admin_lesson_path(@lesson), notice: 'Урок создан.' 
    else
      render :new 
    end   
  end

  def show
  end

  def edit
  end

  def update
     if @lesson.update(lesson_params)
      redirect_to admin_lesson_path(@lesson), notice: 'Урок изменен.' 
    else
       render :edit 
    end
  end

  def destroy
    @lesson.destroy
    redirect_to admin_lessons_path, notice: 'Урок удален.'
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:style, :start_time, :duration, :group_id, teacher_ids: [])
  end

end
