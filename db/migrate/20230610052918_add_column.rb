class AddColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :reference_no, :string
  end
end
