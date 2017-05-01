class AddMinimumAgeToTour < ActiveRecord::Migration[5.0]
  def change
    add_column :tours, :minimum_age, :integer, default: 0
  end
end
