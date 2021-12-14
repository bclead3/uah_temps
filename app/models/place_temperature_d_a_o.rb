# frozen_string_literal: true

class PlaceTemperatureDAO
  HEADERS = %w[Year Mo Globe Land Ocean NH Land Ocean SH Land Ocean Trpcs Land Ocean NoExt Land Ocean SoExt Land Ocean NoPol Land Ocean SoPol Land Ocean USA48 USA49 AUST].freeze
  FULL_HEADERS = ['Year', 'Month', 'Globe', 'Globe Land', 'Globe Ocean', 'N. Hemisphere', 'N. Hemisphere Land', 'N. Hemisphere Ocean', 'S. Hemisphere',
                  'S. Hemisphere Land', 'S. Hemisphere Ocean', 'Tropics (-20 to 20 lat)', 'Tropics Land', 'Tropics Ocean',
                  'North of Tropics (20 to 90)', 'North of Tropics Land', 'North of Tropics Ocean', 'South of Tropics (-90 to -20)',
                  'South of Tropics Land', 'South of Tropics Ocean', 'Arctic Area (60 to 90)', 'Arctic Area Land', 'Arctic Area Ocean',
                  'Antarctic Area (-90 to -60)', 'Antarctic Area Land', 'Antarctic Area Ocean', 'USA Lower 48', 'USA Lower 48 & Alaska',
                  'Australia'].freeze

  DEFAULT_COLUMN_SIZE = 29

  attr_reader :year, :month, :date, :headers, :output_arr

  def initialize(place_temperature_array)
    if place_temperature_array.size == DEFAULT_COLUMN_SIZE && place_temperature_array.first != 'Year'
      float_arr = place_temperature_array.map(&:to_f)
      @year = float_arr.first.to_i
      @month = float_arr[1].to_i
      dt_str = "#{@year}-#{@month}-01"
      @date = Date.parse(dt_str)
      process(float_arr)
    end
  end

  def date_str
    @date.to_s
  end

  def process(place_temp_arr)
    @output_arr = []
    dt_str = date_str
    (2..(place_temp_arr.size - 1)).each do |col_index|
      place = FULL_HEADERS[col_index]
      tmp = place_temp_arr[col_index]
      Rails.logger.debug "#{dt_str}\t#{place}\t#{tmp}"
      pl_tmp = PlaceTemp.find_or_create_by(place: place, date: dt_str, temp: tmp)
      Rails.logger.debug pl_tmp.inspect
      @output_arr << pl_tmp
    end
    @output_arr
  end
end
