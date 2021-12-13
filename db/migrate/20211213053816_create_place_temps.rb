class CreatePlaceTemps < ActiveRecord::Migration[6.1]
  def change
    create_table :place_temps, id: :uuid do |t|
      t.string :place
      t.date :date
      t.float :temp

      t.timestamps
    end
  end
end
