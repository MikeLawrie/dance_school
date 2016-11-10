class AddUserIdToStudent < ActiveRecord::Migration[5.0]
  def change
    add_belongs_to :students, :user
  end
end
