namespace :uah_data do

  desc 'Populate satellite temperature data from the University of Alabama at Huntsville'
  task populate: :environment do
    open('data/file_to_write.txt', 'wb') do |file|
      URI.open('https://www.nsstc.uah.edu/data/msu/v6.0/tlt/uahncdc_lt_6.0.txt') do |uri|
        file.write(uri.read)
      end
    end

    File.foreach('data/file_to_write.txt') do |line|
      line_arr = line.split.compact
      #puts line_arr.inspect
      PlaceTemperatureDAO.new(line_arr)
    end
  end

end
