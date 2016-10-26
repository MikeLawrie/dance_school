class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.string          "style", null: false
      t.string          "teacher", null: false
      t.datetime        "start_time"
      t.integer         "duration", null: false

      t.timestamps
    end
  end
end
