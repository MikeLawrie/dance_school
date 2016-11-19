class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show]

  def index
    @teachers = Teacher.all
  end

  def show
  end

  private

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

end
