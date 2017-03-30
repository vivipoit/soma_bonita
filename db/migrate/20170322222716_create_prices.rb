class CreatePrices < ActiveRecord::Migration[5.0]
  def change
    create_table :prices do |t|
      t.references :tour, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.decimal :adult_price
      t.decimal :child_price
      t.decimal :baby_price
      t.integer :season_type

      t.timestamps
    end
  end
end
