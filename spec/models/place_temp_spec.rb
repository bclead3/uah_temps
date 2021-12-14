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

  it 'requires place' do
    pt = PlaceTemp.create( date: Date.today, temp: -1.4)
    expect(pt.errors.count).to eq(1)
    expect(pt.errors.first.attribute).to eq(:place)   # no place
    expect(pt.errors.first.type).to eq(:blank)        # not filled in
  end

  it 'requires date' do
    pt = PlaceTemp.create( place: 'Park Place', temp: -1.4)
    expect(pt.errors.count).to eq(1)
    expect(pt.errors.first.attribute).to eq(:date)   # no date
    expect(pt.errors.first.type).to eq(:blank)       # not filled in
  end

  it 'requires temp' do
    pt = PlaceTemp.create( place: 'Park Place', date: Date.today )
    expect(pt.errors.count).to eq(2)
    error_hash = pt.errors.to_hash
    expect(error_hash.keys).to eq([:temp])                # no temp
    expect(error_hash[:temp][0]).to eq("can't be blank")  # not filled in
    expect(error_hash[:temp][1]).to eq('is not a number') # not a number
  end
end
