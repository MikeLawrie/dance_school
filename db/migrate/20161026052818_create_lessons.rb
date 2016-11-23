class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.string          "style", null: false
      t.datetime        "start_time"
      t.integer         "duration", null: false
      t.datetime        "end_time"

      t.timestamps
    end
  end
end
