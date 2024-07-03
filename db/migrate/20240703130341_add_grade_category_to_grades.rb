class AddGradeCategoryToGrades < ActiveRecord::Migration[7.1]
  def change
    add_column :grades, :grade_category_id, :integer
  end
end
