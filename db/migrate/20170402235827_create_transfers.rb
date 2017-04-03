class CreateTransfers < ActiveRecord::Migration[5.0]
  def change
    create_table :transfers do |t|
      t.references :tour, foreign_key: true
      t.string :name
      t.integer :seat_type

      t.timestamps
    end
  end
end
