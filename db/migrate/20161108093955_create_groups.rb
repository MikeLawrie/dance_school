class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string          "style", null: false
      t.string          "title", null: false
      t.timestamps
    end
  end
end
