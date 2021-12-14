class AddPlaceTempsIndex < ActiveRecord::Migration[6.1]
  def change
    add_index :place_temps, [:place, :date]
  end
end
