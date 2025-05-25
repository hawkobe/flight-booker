class CreateFlights < ActiveRecord::Migration[8.0]
  def change
    create_table :flights do |t|
      t.references :arrival_airport, null: false, foreign_key: { to_table: :airports }, index: true
      t.references :departure_airport, null: false, foreign_key: { to_table: :airports }, index: true
      t.datetime :departure_time
      t.string :duration

      t.timestamps
    end
  end
end
