class AddUsersColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :student_id, :string
    add_column :users, :name, :string
  end
end
