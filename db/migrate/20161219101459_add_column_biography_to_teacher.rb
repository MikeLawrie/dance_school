class AddColumnBiographyToTeacher < ActiveRecord::Migration[5.0]
  def change
    add_column :teachers, :biography, :text
  end
end
