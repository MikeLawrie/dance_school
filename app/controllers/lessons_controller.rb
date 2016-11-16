class LessonsController < ApplicationController
   before_action :set_lesson, only: [:show, :sign, :sign_init]
   before_action :authenticate_user!, only: :sign_init

  def index
    @lessons = Lesson.all
  end

  def show
  end

  def sign

  end

  def sign_init
     @lesson.sign_init(current_user.student)
     redirect_to lesson_path
  end

  def my
    @lessons = current_user.student.lessons
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

end