# frozen_string_literal: true

module PlaceTempsConcern
  def keyitize(str)
    paren_index = str.index('(')
    str = str[0..(paren_index - 2)] if paren_index
    str.downcase.gsub(' land', '').gsub(' ocean', '').gsub('.', '').gsub(' ', '_').gsub('&', 'w')
  end

  def blank_hash
    return_hash = {}
    PlaceTemperatureDAO::FULL_HEADERS[2..29].each_with_index do |header, header_index|
      key = keyitize(header)
      if [0, 3, 6, 9, 12, 15, 18, 21].member?(header_index)
        puts "#{header_index}\t#{key}"
        return_hash[keyitize(header).to_sym] = { all: {}, land: {}, ocean: {} }
      elsif [24, 25, 26].member?(header_index)
        puts "#{header_index}\t#{key}"
        return_hash[keyitize(header).to_sym] = {}
      elsif [1, 4, 7, 10, 13, 16, 19, 22].member?(header_index)

      end
    end
    return_hash
  end

  def new_hash_format
    new_hash = blank_hash
    PlaceTemperatureDAO::FULL_HEADERS[2..29].each_with_index do |header, header_index|
      key = keyitize(header).to_sym
      puts "#{header_index}\t#{key}"
      if [0, 3, 6, 9, 12, 15, 18, 21].member?(header_index)
        new_hash[key][:all] = {}
        new_hash[key][:all][:place] = header
        place_temp_arr = PlaceTemp.where(place: header).order(:date)
        place_temp_arr.each_with_index do |place_temp, pt_index|
          pt_increment_idx = pt_index + 1
          new_hash[key][:all][pt_increment_idx.to_s] = {}
          new_hash[key][:all][pt_increment_idx.to_s][:id] = place_temp.id
          new_hash[key][:all][pt_increment_idx.to_s][:date] = place_temp.date
          new_hash[key][:all][pt_increment_idx.to_s][:temp] = place_temp.temp
        end
      elsif [24, 25, 26].member?(header_index)
        new_hash[key] = {}
        new_hash[key][:place] = header
        place_temp_arr = PlaceTemp.where(place: header).order(:date)
        place_temp_arr.each_with_index do |place_temp, pt_index|
          pt_increment_idx = pt_index + 1
          new_hash[key][pt_increment_idx.to_s] = {}
          new_hash[key][pt_increment_idx.to_s][:id] = place_temp.id
          new_hash[key][pt_increment_idx.to_s][:date] = place_temp.date
          new_hash[key][pt_increment_idx.to_s][:temp] = place_temp.temp
        end
      elsif [1, 4, 7, 10, 13, 16, 19, 22].member?(header_index)
        new_hash[key][:land] = {}
        new_hash[key][:land][:place] = header
        place_temp_arr = PlaceTemp.where(place: header).order(:date)
        place_temp_arr.each_with_index do |place_temp, pt_index|
          pt_increment_idx = pt_index + 1
          new_hash[key][:land][pt_increment_idx.to_s] = {}
          new_hash[key][:land][pt_increment_idx.to_s][:id] = place_temp.id
          new_hash[key][:land][pt_increment_idx.to_s][:date] = place_temp.date
          new_hash[key][:land][pt_increment_idx.to_s][:temp] = place_temp.temp
        end
      elsif [2, 5, 8, 11, 14, 17, 20, 23].member?(header_index)
        new_hash[key][:ocean] = {}
        new_hash[key][:ocean][:place] = header
        place_temp_arr = PlaceTemp.where(place: header).order(:date)
        place_temp_arr.each_with_index do |place_temp, pt_index|
          pt_increment_idx = pt_index + 1
          new_hash[key][:ocean][pt_increment_idx.to_s] = {}
          new_hash[key][:ocean][pt_increment_idx.to_s][:id] = place_temp.id
          new_hash[key][:ocean][pt_increment_idx.to_s][:date] = place_temp.date
          new_hash[key][:ocean][pt_increment_idx.to_s][:temp] = place_temp.temp
        end
      end
    end
    new_hash
  end
end
