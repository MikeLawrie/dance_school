class CreateLessonsTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons_teachers do |t|
      t.integer :teacher_id, null: false
      t.integer :lesson_id, null: false

      t.timestamps
    end
  end
end
