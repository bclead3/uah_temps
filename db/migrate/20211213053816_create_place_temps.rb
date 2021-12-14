class CreatePlaceTemps < ActiveRecord::Migration[6.1]
  def change
    create_table :place_temps, id: :uuid do |t|
      t.string  :place, null: false
      t.date    :date, null: false
      t.float   :temp, null: false

      t.timestamps
    end
  end
end
