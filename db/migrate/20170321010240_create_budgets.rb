class CreateBudgets < ActiveRecord::Migration[5.0]
  def change
    create_table :budgets do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :tour_name
      t.integer :quantity_adults
      t.integer :quantity_children
      t.integer :quantity_babies

      t.timestamps
    end
  end
end
