class CreateTours < ActiveRecord::Migration[5.0]
  def change
    create_table :tours do |t|
      t.string :name
      t.text   :description
      t.string :category
      t.string :attraction
      t.integer :duration
      t.decimal :adult_price
      t.decimal :child_price
      t.decimal :baby_price
      t.decimal :distance

      t.timestamps
    end
  end
end
