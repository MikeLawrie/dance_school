class AddFlagsToStudentsLessons < ActiveRecord::Migration[5.0]
  def change
    add_column :students_lessons, :presence, :boolean, default: false
    add_column :students_lessons, :sign_by_admin, :boolean  
  end
end
