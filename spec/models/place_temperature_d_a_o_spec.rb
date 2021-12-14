# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PlaceTemperatureDAO, type: :model do
  let(:line_arr) do
    %w[1978 12 -0.48 -0.51 -0.47 -0.44 -0.46 -0.42 -0.52 -0.62 -0.50 -0.60 -0.62 -0.59 -0.37 -0.44 -0.30 -0.46 -0.55 -0.45 -0.39 -0.68 -0.06 -0.45 -0.38 -0.49 -1.29 -1.15
       -1.29].map(&:to_f)
  end

  it 'parses a line starting with a year' do
    dao = PlaceTemperatureDAO.new(line_arr)
    expect(dao.date_str).to eq('1978-12-01')
    expect(PlaceTemp.count).to eq(27)
    expect(PlaceTemp.count).to eq(dao.output_arr.count)
  end

  it 'provides full headers' do
    header_arr = PlaceTemperatureDAO::FULL_HEADERS
    trunc_header_arr = PlaceTemperatureDAO::HEADERS

    expect(header_arr[0]).to eq('Year')
    expect(header_arr[0]).to eq(trunc_header_arr[0])

    expect(header_arr[1]).to eq('Month')
    expect(trunc_header_arr[1]).to eq('Mo')

    expect(header_arr[2]).to eq('Globe')
    expect(header_arr[2]).to eq(trunc_header_arr[2])

    expect(header_arr[3]).to eq('Globe Land')
    expect(trunc_header_arr[3]).to eq('Land')

    expect(header_arr[4]).to eq('Globe Ocean')
    expect(trunc_header_arr[4]).to eq('Ocean')

    expect(header_arr[5]).to eq('N. Hemisphere')
    expect(trunc_header_arr[5]).to eq('NH')

    expect(header_arr[6]).to eq('N. Hemisphere Land')
    expect(trunc_header_arr[6]).to eq('Land')

    expect(header_arr[7]).to eq('N. Hemisphere Ocean')
    expect(trunc_header_arr[7]).to eq('Ocean')
  end
end
