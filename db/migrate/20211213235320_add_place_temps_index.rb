# frozen_string_literal: true

class AddPlaceTempsIndex < ActiveRecord::Migration[6.1]
  def change
    add_index :place_temps, %i[place date]
  end
end
