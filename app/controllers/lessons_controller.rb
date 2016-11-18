class LessonsController < ApplicationController
   before_action :set_lesson, only: [:show, :sign, :sign_done, :sign_out, :sign_out_done]
   before_action :authenticate_user!, only: [:sign, :sign_done, :sign_out, :sign_out_done]

  def index
    @lessons = Lesson.all
  end

  def show
  end

  def sign
    @presence = @lesson.student_present?(current_user.student)
  end

  def sign_done
     @lesson.sign_done(current_user.student)
     redirect_to lesson_path
  end

  def sign_out_done
    @lesson.sign_out_done(current_user.student)
    redirect_to lessons_path
  end


  def my
    @lessons = current_user.student.lessons
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

end