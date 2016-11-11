class LessonsController < ApplicationController
   before_action :set_lesson, only: [:show]

  def index
    @lessons = Lesson.all
  end

  def show
  end

  def sign
    @lesson = Lesson.find(params[:lesson_id])
  end

  def sign_init
     @lesson = Lesson.find(params[:lesson_id])
     @lesson.sign_init(current_user.student)
     redirect_to lesson_path
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

end