require 'rails_helper'

RSpec.describe PlaceTemp, type: :model do

  it 'creates a valid PlaceTemp entry' do
    plc_temp = PlaceTemp.create( place: 'N America', date: Date.today, temp: -1.4)
    expect(plc_temp.place).to eq('N America')
    expect(plc_temp.date).to eq(Date.today)
    expect(plc_temp.temp).to eq(-1.4)
    expect(plc_temp.created_at.utc).to be_within(1.second).of(Time.now)
    expect(plc_temp.updated_at.utc).to be_within(1.second).of(Time.now)
    expect(plc_temp.id.length).to eq(36)
  end
end
