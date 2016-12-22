class Lesson < ApplicationRecord
  belongs_to :group, optional: true
  belongs_to :room
  has_many :lessons_teachers
  has_many :teachers, through: :lessons_teachers
  has_many :students_lessons
  has_many :students, through: :students_lessons

  scope :by_time, -> { order(:start_time) }
  before_validation :set_end_time

  validate :validate_room_time
  validate :validate_teacher_time
  validates :teachers, presence: true
  validates :style, presence: true  
  validates :start_time, presence: true  
  validates :duration, {presence: true, numericality:{ greater_than: 0}}  
  validates :end_time, presence: true  

  def sign_done(student, by_admin = false)
    self.students << student
    student_lesson = find_students_lessons(student)
    student_lesson.sign_by_admin = by_admin
    student_lesson.save
  end

  def sign_out_done(student)
    self.students.delete(student)
  end

  def student_present?(student)
    find_students_lessons(student)
  end
  
  def lesson_students_status(studs = self.students)
    @list = {}
    studs.by_last_name.each do |stud|
      sl = find_students_lessons(stud)
      @list[stud] = sl
    end
    @list
  end

  def student_presence(sl,val)
    sl.presence = val
    sl.save
  end

  def self.relevant_lessons(weeks_before, weeks_after)
    lessons = []   
    current_week = Time.now.strftime('%W').to_i
    range = (current_week - weeks_before)..(current_week + weeks_after) 
    Lesson.find_each { |lesson| lessons << lesson if range.include?(lesson.start_time.strftime('%W').to_i)} 
    self.sort_by_time(lessons)
  end

  def self.sort_by_time(lessons)
    lessons_sorted = []
    time_lessons = {}
    lessons.each { |lesson| time_lessons[lesson.start_time] = lesson }
    lessons_time = time_lessons.sort
    lessons_time.each {|time,lesson| lessons_sorted << lesson}
    lessons_sorted
  end

  private

  def lessons_cross
    cross = []
    Lesson.where('end_time > ?', Time.now).find_each do |lesson|
      cross << lesson if lesson.start_time.between?(self.start_time, self.end_time)  || 
      lesson.end_time.between?(self.start_time, self.end_time)
    end
    cross.delete(self)
    cross
  end

  def lessons_cross_memo
    @cross ||= lessons_cross
  end

  def validate_room_time
    lessons_cross_memo.each {|lesson| errors.add(:base,'Время проведения пересекается с другими занятиями в этом зале') if lesson.room == self.room} 
  end

  def validate_teacher_time
    lessons_cross_memo.each {|lesson| errors.add(:base,'Преподаватель уже ведет занятие в это время') if lesson.teachers & self.teachers} 
  end

  def set_end_time
    self.duration ||= 0
    self.end_time = self.start_time + self.duration * 60    
  end

  def find_students_lessons(student)
    students_lessons.where(student_id: student.id, lesson_id: self.id).first
  end

end