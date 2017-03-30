class RemoveCategoryFromTours < ActiveRecord::Migration[5.0]
  def change
    remove_column :tours, :category, :string
  end
end
