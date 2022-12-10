class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :location, null: false
      t.json :weather_data, null: false
      t.datetime :weather_requested_at, null: false
      t.timestamps
    end
  end
end
