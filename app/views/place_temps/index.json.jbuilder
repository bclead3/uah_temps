# frozen_string_literal: true

json.array! @place_temps, partial: 'place_temps/place_temp', as: :place_temp
