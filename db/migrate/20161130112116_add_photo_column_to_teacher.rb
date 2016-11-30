class AddPhotoColumnToTeacher < ActiveRecord::Migration[5.0]
  def up
    add_attachment :teachers, :photo
  end

  def down
    remove_attachment :teachers, :photo
  end
end
