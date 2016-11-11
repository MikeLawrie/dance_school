class CreateStudentsLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :students_lessons do |t|
      t.integer :student_id, null: false
      t.integer :lesson_id, null: false

      t.timestamps
    end
  end
end
