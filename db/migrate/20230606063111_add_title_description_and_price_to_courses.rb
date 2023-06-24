class AddTitleDescriptionAndPriceToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :title, :string
    add_column :courses, :description, :text
    add_column :courses, :price, :decimal
  end
end
