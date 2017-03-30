class RemoveFieldsFromTours < ActiveRecord::Migration[5.0]
  def change
    remove_column :tours, :adult_price, :decimal
    remove_column :tours, :child_price, :decimal
    remove_column :tours, :baby_price, :decimal
  end
end
