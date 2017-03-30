class AddCategoryRefToTours < ActiveRecord::Migration[5.0]
  def change
    add_reference :tours, :category, foreign_key: true
  end
end
