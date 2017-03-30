class CreateHighSeasons < ActiveRecord::Migration[5.0]
  def change
    create_table :high_seasons do |t|
      t.string :name
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
